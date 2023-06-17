import 'dart:async';
import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';
import '../widgets/alarm_tile.dart';
import 'ring.dart';
import 'edit_alarm.dart';

class AlarmScreen extends StatefulWidget {
  const AlarmScreen({Key? key}) : super(key: key);

  @override
  State<AlarmScreen> createState() => _AlarmScreenState();
}

class _AlarmScreenState extends State<AlarmScreen> {
  late List<AlarmSettings> alarms;
  static StreamSubscription? subscription;
  bool isLocked = true;

  @override
  void initState() {
    super.initState();
    loadAlarms();
    subscription ??= Alarm.ringStream.stream.listen(navigateToRingScreen);
  }

  @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
  }

  void loadAlarms() {
    alarms = Alarm.getAlarms();
    alarms.sort((a, b) => a.dateTime.isBefore(b.dateTime) ? 0 : 1);
    setState(() {});
  }

  Future<void> navigateToRingScreen(AlarmSettings alarmSettings) async {
    await Navigator.push(context, MaterialPageRoute(builder: (context) => RingScreen(alarmSettings: alarmSettings)));
    loadAlarms();
  }

  Future<void> navigateToAlarmScreen(AlarmSettings? settings) async {
    final res = await showModalBottomSheet<bool?>(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      builder: (context) => FractionallySizedBox(
        heightFactor: 0.6,
        child: EditAlarmScreen(alarmSettings: settings),
      ),
    );
    if (res != null && res == true) loadAlarms();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(isLocked ? Icons.lock : Icons.lock_open, color: const Color(0xff212435), size: 24),
          onPressed: () => setState(() => isLocked = !isLocked),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Color(0xff212435), size: 24),
            onPressed: () => navigateToAlarmScreen(null),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                alarms.isEmpty ? "You have no alarms" : "Alarms",
                style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 30, color: Colors.black),
              ),
            ),
            Expanded(
              child: alarms.isEmpty
                  ? Container()
                  : ListView.separated(
                      itemCount: alarms.length,
                      separatorBuilder: (context, index) => const Divider(),
                      itemBuilder: (context, index) {
                        return AlarmTile(
                          key: Key(alarms[index].id.toString()),
                          title: TimeOfDay(hour: alarms[index].dateTime.hour, minute: alarms[index].dateTime.minute).format(context),
                          onPressed: isLocked ? null : () => navigateToAlarmScreen(alarms[index]),
                          onDismissed: () => Alarm.stop(alarms[index].id).then((_) => loadAlarms()),
                          isLocked: isLocked,
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

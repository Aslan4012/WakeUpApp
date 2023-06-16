import 'dart:async';

import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';
import '../widgets/alarm_tile.dart';
import 'edit_alarm.dart';
import 'ring.dart';

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
    subscription ??= Alarm.ringStream.stream.listen(
      (alarmSettings) => navigateToRingScreen(alarmSettings),
    );
  }

  void loadAlarms() {
    setState(() {
      alarms = Alarm.getAlarms();
      alarms.sort((a, b) => a.dateTime.isBefore(b.dateTime) ? 0 : 1);
    });
  }

  Future<void> navigateToRingScreen(AlarmSettings alarmSettings) async {
    await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              ExampleAlarmRingScreen(alarmSettings: alarmSettings),
        ));
    loadAlarms();
  }

  Future<void> navigateToAlarmScreen(AlarmSettings? settings) async {
    final res = await showModalBottomSheet<bool?>(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        builder: (context) {
          return FractionallySizedBox(
            heightFactor: 0.6,
            child: ExampleAlarmEditScreen(alarmSettings: settings),
          );
        });

    if (res != null && res == true) loadAlarms();
  }

  @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0x00ffffff),
        leading: IconButton(
          icon: Icon(isLocked ? Icons.lock : Icons.lock_open,
              color: const Color(0xff212435), size: 24),
          onPressed: () {
            setState(() {
              isLocked = !isLocked; // isLocked is notted
            });
          },
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
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 30,
                  color: Color(0xff000000),
                ),
              ),
            ),
            Expanded(
              child: alarms.isNotEmpty
                ? ListView.separated(
                  itemCount: alarms.length,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, index) {
                    return AlarmTile(
                      key: Key(alarms[index].id.toString()),
                      title: TimeOfDay(
                        hour: alarms[index].dateTime.hour,
                        minute: alarms[index].dateTime.minute,
                      ).format(context),
                      onPressed: isLocked ? null : () => navigateToAlarmScreen(alarms[index]),
                      onDismissed: () {
                        Alarm.stop(alarms[index].id).then((_) => loadAlarms());
                      },
                      isLocked: isLocked,
                    );
                  },
                )
              : Container(), 
            ),
          ],
        ),
      ),

    );
  }
}


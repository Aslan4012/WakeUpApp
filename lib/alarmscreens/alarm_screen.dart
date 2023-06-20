import 'dart:async';
import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';
import 'package:softwareprojekt/globaldata/global_data.dart';
import '../widgets/alarm_tile.dart';
import 'ring.dart';
import 'edit_alarm.dart';

class AlarmScreen extends StatefulWidget {
  const AlarmScreen({Key? key}) : super(key: key);

  @override
  State<AlarmScreen> createState() => _AlarmScreenState();
}

class _AlarmScreenState extends State<AlarmScreen> with WidgetsBindingObserver {
  late List<AlarmSettings> alarms;
  static StreamSubscription? subscription;
  bool showAnimation = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    loadAlarms();
    subscription ??= Alarm.ringStream.stream.listen(navigateToRingScreen);
    handleChallengeResult();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    subscription?.cancel();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      handleChallengeResult();
    }
  }

  void loadAlarms() {
    alarms = Alarm.getAlarms();
    alarms.sort((a, b) => a.dateTime.isBefore(b.dateTime) ? 0 : 1);
    setState(() {});
  }

  Future<void> navigateToRingScreen(AlarmSettings alarmSettings) async {
    String challenge = GlobalData().alarmChallenges[alarmSettings.id] ?? 'Math';

    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RingScreen(
          alarmSettings: alarmSettings,
          challenge: challenge,
        ),
      ),
    );
    loadAlarms();
  }

  Future<void> navigateToEditAlarmScreen(AlarmSettings? settings) async {
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

  void handleChallengeResult() {
    setState(() {
      if (GlobalData().showAnimation) {
        showAnimation = true;
        Timer(const Duration(seconds: 2), () {
          setState(() {
            showAnimation = false;
          });
        });
        GlobalData().showAnimation = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Color(0xff212435), size: 24),
            onPressed: () => navigateToEditAlarmScreen(null),
          )
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    alarms.isEmpty ? "You have no alarms" : "Alarms",
                    style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 30,
                        color: Colors.black),
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
                              title: TimeOfDay(
                                      hour: alarms[index].dateTime.hour,
                                      minute: alarms[index].dateTime.minute)
                                  .format(context),
                              onPressed: () =>
                                  navigateToEditAlarmScreen(alarms[index]),
                              onDismissed: (direction) {
                                final alarmId = alarms[index].id;
                                GlobalData().alarmChallenges.remove(alarmId);
                                Alarm.stop(alarmId).then((_) => loadAlarms());
                              },
                            );
                          },
                        ),
                ),
              ],
            ),
            if (showAnimation) ...[
              Align(
                alignment: Alignment.center,
                child: AnimatedOpacity(
                  opacity: showAnimation ? 1.0 : 0.0,
                  duration: const Duration(seconds: 3),
                  curve: Curves.easeInOut,
                  child: const Icon(
                    Icons.check,
                    color: Colors.green,
                    size: 60,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../alarm/alarm_object.dart'; 
import '../alarm/alarm_list.dart';

class AlarmScreen extends StatefulWidget {
  const AlarmScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AlarmScreenState createState() => _AlarmScreenState();
}

class _AlarmScreenState extends State<AlarmScreen> {
  bool isLocked = true; // bool to check if the alarms are locked or not
  // Initialize alarms
  List<Alarm> activeAlarms = [
    Alarm(time: '05:38', challenge: 'Walk'),
    Alarm(time: '05:38', challenge: 'Walk'),
  ];
  List<Alarm> inactiveAlarms = [
    Alarm(time: '07:40', challenge: 'Shake', isActive: false),
  ];

  void toggleAlarm(Alarm alarm) {
    setState(() {
      if (alarm.isActive) {
        inactiveAlarms.remove(alarm);
        activeAlarms.add(alarm);
      } else {
        activeAlarms.remove(alarm);
        inactiveAlarms.add(alarm);
      }
    });
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
            onPressed: () {},
          )
        ],
      ),
      
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            //Active alarms section
            Expanded(
              child: AlarmList(
                title: "Active Alarms",
                alarms: activeAlarms,
                onToggle: toggleAlarm,
              ),
            ),
            //Inactive alarms section
            Expanded(
              child: AlarmList(
                title: "Inactive Alarms",
                alarms: inactiveAlarms,
                onToggle: toggleAlarm,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

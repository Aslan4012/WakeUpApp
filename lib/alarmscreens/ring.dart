import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';
import 'package:softwareprojekt/mathscreens/math_welcome.dart';

class RingScreen extends StatelessWidget {
  final AlarmSettings alarmSettings;
  final String challenge;

  const RingScreen({Key? key, required this.alarmSettings, required this.challenge}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildAlarmInfo(context),
            _buildActionButtons(context),
          ],
        ),
      ),
    );
  }

Route mapChallengeToScreen(String challenge) {
  switch(challenge) {
    case 'Math': return MaterialPageRoute(builder: (context) => MathChallenges(alarmId: alarmSettings.id));
    //case 'Walk': return MaterialPageRoute(builder: (context) => WalkChallengeScreen(alarmId: alarmSettings.id));
    //case 'Spin': return MaterialPageRoute(builder: (context) => SpinChallengeScreen(alarmId: alarmSettings.id));
    //case 'Shake': return MaterialPageRoute(builder: (context) => ShakeChallengeScreen(alarmId: alarmSettings.id));
    default: throw Exception('SOMEHOW PASSED ON: $challenge'); //WONT HAPPEN, PLEASE....
  }
}



  Widget _buildAlarmInfo(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.alarm, size: 100),
        Text(
          TimeOfDay(
            hour: alarmSettings.dateTime.hour,
            minute: alarmSettings.dateTime.minute,
          ).format(context),
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 40,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildSnoozeButton(context),
        _buildStopButton(context),
      ],
    );
  }

  Widget _buildSnoozeButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _handleSnooze(context),
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(150, 60),
      ),
      child: const Text(
        "Snooze",
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
          color: Colors.black,
        ),
      ),
    );
  }

  //Add 1 minute from current time.
  void _handleSnooze(BuildContext context) {
    final now = DateTime.now();
    final snoozeTime = now.add(const Duration(minutes: 1));
    Alarm.set(
      alarmSettings: alarmSettings.copyWith(
        dateTime: DateTime(snoozeTime.year, snoozeTime.month, snoozeTime.day, snoozeTime.hour, snoozeTime.minute, 0, 0),
      ),
    ).then((_) {
      Navigator.pop(context);
    });
  }


  Widget _buildStopButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _handleStop(context),
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(150, 60),
      ),
      child: const Text(
        "Stop",
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
          color: Colors.black,
        ),
      ),
    );
  }

  void _handleStop(BuildContext context) {
    Navigator.push(context, mapChallengeToScreen(challenge));
  }
}

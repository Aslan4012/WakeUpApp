import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';
import 'challenges_screen.dart';

class RingScreen extends StatelessWidget {
  final AlarmSettings alarmSettings;

  const RingScreen({Key? key, required this.alarmSettings}) : super(key: key);

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

  //new alarm =  +1 minute from current time.
  void _handleSnooze(BuildContext context) {
    final now = DateTime.now();
    Alarm.set(
      alarmSettings: alarmSettings.copyWith(
        dateTime: DateTime(now.year, now.month, now.day, now.hour, now.minute, 0, 0)
            .add(const Duration(minutes: 1)),
      ),
    ).then((_) => Navigator.pop(context));
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
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChallengeScreen(alarmId: alarmSettings.id),
      ),
    );
  }
}

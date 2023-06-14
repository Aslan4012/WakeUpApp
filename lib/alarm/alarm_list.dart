import 'package:flutter/material.dart';
import 'alarm_object.dart';
import 'alarm_tile.dart';

class AlarmList extends StatelessWidget {
  final String title;
  final List<Alarm> alarms;
  final void Function(Alarm) onToggle;

  const AlarmList({super.key, required this.title, required this.alarms, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding( 
          padding: const EdgeInsets.fromLTRB(0, 16, 0, 20),
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 24,
              color: Color(0xff000000),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: alarms.length,
            itemBuilder: (context, index) {
              return AlarmTile(alarm: alarms[index], onToggle: onToggle);
            },
          ),
        ),
      ],
    );
  }
}

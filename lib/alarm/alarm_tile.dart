import 'package:flutter/material.dart';
import 'alarm_object.dart';

class AlarmTile extends StatefulWidget {
  final Alarm alarm;
  final void Function(Alarm) onToggle;

  const AlarmTile({super.key, required this.alarm, required this.onToggle});

  @override
  _AlarmTileState createState() => _AlarmTileState();
}

class _AlarmTileState extends State<AlarmTile> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xffffffff),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
        side: const BorderSide(color: Color(0x4d9e9e9e), width: 1),
      ),
      
      child: ListTile(
        leading: const Column( 
          mainAxisAlignment: MainAxisAlignment.center,  
          children: [
            Icon(Icons.alarm, color: Color(0xff212435), size: 24),
          ],
        ),

        title: Text(
          widget.alarm.time,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 20,
            color: Color(0xff000000),
          ),
          textAlign: TextAlign.start,
        ),
        subtitle: Text(
          widget.alarm.challenge,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: Color(0xff000000),
          ),
          textAlign: TextAlign.start,
        ),
        trailing: Switch(
          value: widget.alarm.isActive,
          onChanged: (value) {
            setState(() {
              widget.alarm.isActive = value;
              widget.onToggle(widget.alarm);
            });
          },
        ),
      ),
    );
  }
}



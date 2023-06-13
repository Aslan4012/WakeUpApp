import 'package:flutter/material.dart';

class AlarmTile extends StatefulWidget {
  final String title;
  final String subtitle;

  AlarmTile({required this.title, required this.subtitle});

  @override
  _AlarmTileState createState() => _AlarmTileState();
}

class _AlarmTileState extends State<AlarmTile> {
  bool _switchValue = true;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(4),
      color: Color(0xffffffff),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
        side: BorderSide(color: Color(0x4d9e9e9e), width: 1),
      ),
      child: ListTile(
        //Icon is wrapped in a colummn for centering...
        leading: Column( 
          mainAxisAlignment: MainAxisAlignment.center,  // aligns the icon vertically center
          children: [
            Icon(Icons.alarm, color: Color(0xff212435), size: 24),
          ],
        ),
        title: Text(
          widget.title,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 20,
            color: Color(0xff000000),
          ),
          textAlign: TextAlign.start,
        ),
        subtitle: Text(
          widget.subtitle,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: Color(0xff000000),
          ),
          textAlign: TextAlign.start,
        ),
        trailing: Switch(
          value: _switchValue,
          onChanged: (value) {
            setState(() {
              _switchValue = value;
            });
          },
        ),
      ),
    );
  }
}

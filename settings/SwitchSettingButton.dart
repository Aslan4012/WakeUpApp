import 'package:flutter/material.dart';
class CustomSwitch extends StatefulWidget {
  const CustomSwitch({super.key});

  @override
  State<CustomSwitch> createState() => CustomSwitchState();
}

 class CustomSwitchState extends State<CustomSwitch> {
  final String title = 'Time Format';
  final IconData leadingIcon= Icons.alarm;
  bool currentState = false;



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
      child: ListTile(
        tileColor: Color(0x00ffffff),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontSize: 16,
            color: Color(0xff000000),
          ),
          textAlign: TextAlign.left,
        ),
        dense: true,
        contentPadding: EdgeInsets.all(0),
        selected: false,
        selectedTileColor: Color(0x42000000),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        leading: Icon(
          leadingIcon,
          color: Colors.blue,
          size: 24,
        ),
        trailing: Switch(
          value: currentState,
        onChanged: (bool value){
setState(() {
  currentState=value;
  print('object');
});

        },
        ),
      ),
    );
  }
}

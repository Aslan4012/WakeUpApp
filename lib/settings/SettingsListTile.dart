import 'package:flutter/material.dart';

class SettingsListTile extends StatelessWidget {
  final String title;
  final IconData leadingIcon;
  final VoidCallback onTap;

  SettingsListTile({
    required this.title,
    required this.leadingIcon,
    required this.onTap,
  });

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
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: Colors.grey,
          size: 18,
        ),
        onTap: onTap,
      ),
    );
  }
}

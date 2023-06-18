import 'package:flutter/material.dart';

class SettingsListTile extends StatelessWidget {
  final String title;
  final IconData leadingIcon;
  final VoidCallback onTap;

  const SettingsListTile({super.key, 
    required this.title,
    required this.leadingIcon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
      child: ListTile(
        onTap: onTap,
        tileColor: const Color(0x00ffffff),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: Color(0xff000000),
          ),
          textAlign: TextAlign.left,
        ),
        
        leading: Icon(
          leadingIcon,
          color: Colors.blue,
          size: 24,
        ),
       
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.grey,
          size: 18,
        ),
      ),
    );
  }
}

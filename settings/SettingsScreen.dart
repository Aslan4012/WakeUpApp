import 'package:flutter/material.dart';
import 'package:wakeup/settings/SnoozeSettingsScreen.dart';
import 'SettingsListTile.dart';
import 'SettingsSoundScreen.dart';
import 'SwitchSettingButton.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),

        title: Text(
          "Settings",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 24,
            color: Color(0xff000000),
          ),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: 16,
                width: 16,
              ),
              Text(
                "General Setting",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              
              SettingsListTile(
                title: 'Snooze settings',
                leadingIcon: Icons.more_horiz,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)  =>  SnoozeSettingScreen(title:'Snooze Settings')),
                  );
                },
              ),
              SettingsListTile(
                title: 'Andet fis',
                leadingIcon: Icons.build,
                onTap: () {
                  print('Andet fis tapped');
                },
              ),
              SettingsListTile(
                title: 'Customize',
                leadingIcon: Icons.bluetooth,
                onTap: () {
                  print('Customize tapped');
                },
              ),
              SettingsListTile(
                title: 'Sound Settings',
                leadingIcon: Icons.speaker,
                onTap: () {
                  print('Customize tapped');
                  Navigator.push(context, MaterialPageRoute(builder: (context)  =>  SettingsSoundScreen(title:'Sound Settings')),
                  );
                },
              ),
              CustomSwitch()
            ],
          ),
        ),
      ),
    );
  }
}

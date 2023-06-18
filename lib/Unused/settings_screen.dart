// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'settings_listtile.dart';
import 'dropdown_divider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,

        title: const Text(
          "Settings",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 24,
            color: Color(0xff000000),
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              
              const SizedBox(
                height: 16,
                width: 16,
              ),

              const Text(
                "General Setting",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              
              const DropDivider(),
              SettingsListTile(
                title: 'Snooze settings',
                leadingIcon: Icons.more_horiz,
                onTap: () {
                  print('Snooze settings tapped');
                },
              ),
              
              const DropDivider(),
              SettingsListTile(
                title: 'Andet fis',
                leadingIcon: Icons.build,
                onTap: () {
                  print('Andet fis tapped');
                },
              ),
              
              const DropDivider(),
              SettingsListTile(
                title: 'Customize',
                leadingIcon: Icons.bluetooth,
                onTap: () {
                  print('Customize tapped');
                },
              ),
              const DropDivider(),
            ],
          ),
        ),
      ),
    );
  }
}

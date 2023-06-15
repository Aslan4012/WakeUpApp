import 'package:flutter/material.dart';
import 'CustomSlider.dart';
import 'package:perfect_volume_control/perfect_volume_control.dart';

class SettingsSoundScreen extends StatelessWidget {
  String title = '';

  SettingsSoundScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [SizedBox(height: 30,),
          Column(
            children: [
              Text('Volume'),
              SizedBox(height: 20,
                child: CustomSlider()),
            ],
          )
        ],

      ),
      appBar: AppBar(
        title: Text(title),
      ),
    );
  }
}

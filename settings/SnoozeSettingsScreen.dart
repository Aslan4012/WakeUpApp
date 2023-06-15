import 'package:flutter/material.dart';
import 'package:number_inc_dec/number_inc_dec.dart';

class SnoozeSettingScreen extends StatelessWidget {
  String title = '';

  SnoozeSettingScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [Row(children: [NumberInputWithIncrementDecrement(
        controller: TextEditingController(),
        min: 0,
        max: 10,
      )]),],

      ),
      appBar: AppBar(
        title: Text(title),
      ),
    );
  }
}

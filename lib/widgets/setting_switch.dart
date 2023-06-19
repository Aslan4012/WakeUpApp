import 'package:flutter/material.dart';

class SettingSwitch extends StatelessWidget {
  final String title;
  final bool value;
  final Function(bool) onChanged;

  const SettingSwitch({
    Key? key,
    required this.title,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 18, color: Colors.black),
        ),
        Switch(
          value: value,
          onChanged: (value) => onChanged(value),
        ),
      ],
    );
  }
}


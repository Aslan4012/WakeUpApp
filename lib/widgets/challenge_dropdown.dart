import 'package:flutter/material.dart';

class ChallengeDropdown extends StatelessWidget {
  final String value;
  final Function(String) onChanged;

  const ChallengeDropdown({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: value,
      items: const [
        DropdownMenuItem<String>(
          value: 'Math',
          child: Text('Math'),
        ),
        DropdownMenuItem<String>(
          value: 'Walk',
          child: Text('Walk'),
        ),
        DropdownMenuItem<String>(
          value: 'Spin',
          child: Text('Spin'),
        ),
        DropdownMenuItem<String>(
          value: 'Shake',
          child: Text('Shake'),
        ),
      ],
      onChanged: (value) => onChanged(value!),
    );
  }
}


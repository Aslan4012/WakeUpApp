import 'package:flutter/material.dart';

class SoundDropdown extends StatelessWidget {
  final String value;
  final Function(String) onChanged;

  const SoundDropdown({
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
          value: 'assets/mozart.mp3',
          child: Text('Mozart'),
        ),
        DropdownMenuItem<String>(
          value: 'assets/nokia.mp3',
          child: Text('Nokia'),
        ),
        DropdownMenuItem<String>(
          value: 'assets/one_piece.mp3',
          child: Text('One Piece'),
        ),
        DropdownMenuItem<String>(
          value: 'assets/star_wars.mp3',
          child: Text('Star Wars'),
        ),
      ],
      onChanged: (value) => onChanged(value!),
    );
  }
}


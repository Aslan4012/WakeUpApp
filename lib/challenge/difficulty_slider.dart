import 'package:flutter/material.dart';

class DifficultySlider extends StatefulWidget {
  const DifficultySlider({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DifficultySliderState createState() => _DifficultySliderState();
}

class _DifficultySliderState extends State<DifficultySlider> {
  double _currentSliderValue = 5;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 15),
      child: Slider(
        onChanged: (value) {
          setState(() {
            _currentSliderValue = value;
          });
        },
        value: _currentSliderValue,
        min: 0,
        max: 10,
        activeColor: const Color(0xff3a57e8),
        inactiveColor: const Color(0xff9e9e9e),
        divisions: 10,
      ),
    );
  }
}

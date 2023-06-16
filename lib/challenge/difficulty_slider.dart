import 'package:flutter/material.dart';

class DifficultySlider extends StatefulWidget {
  final void Function(double) onChanged;
  final double initialValue;

  const DifficultySlider({Key? key, required this.onChanged, required this.initialValue})
      : super(key: key);

  @override
  _DifficultySliderState createState() => _DifficultySliderState();
}

class _DifficultySliderState extends State<DifficultySlider> {
  double _currentSliderValue = 1;

  @override
  void initState() {
    super.initState();
    _currentSliderValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 15),
      child: Slider(
        onChanged: (value) {
          setState(() {
            _currentSliderValue = value;
          });
          widget.onChanged(value);
        },
        value: _currentSliderValue,
        min: 1,
        max: 3,
        divisions: 2,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'custom_dropdown.dart';
import 'dropdown_divider.dart';
import 'difficulty_slider.dart';
import 'custom_checkbox.dart';

class ChallengeDropDownWidget extends StatefulWidget {
  const ChallengeDropDownWidget({Key? key}) : super(key: key);

  @override
  _ChallengeDropDownWidgetState createState() => _ChallengeDropDownWidgetState();
}

class _ChallengeDropDownWidgetState extends State<ChallengeDropDownWidget> {
  double _difficulty = 1;

  String get difficultyString {
    if (_difficulty == 1) return 'Easy';
    if (_difficulty == 2) return 'Medium';
    if (_difficulty == 3) return 'Hard';
    return 'Unknown';
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: ListView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.fromLTRB(16, 40, 16, 16),
        shrinkWrap: true,
        children: [
          const DropDivider(),
          Text(
            "Difficulty: $difficultyString",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18,
              color: Color(0xff000000),
            ),
          ),
          DifficultySlider(
            onChanged: (value) {
              setState(() {
                _difficulty = value;
              });
            },
            initialValue: _difficulty,
          ),
          const DropDivider(),
          const CustomCheckBox(),
          const DropDivider(),
          const CustomDropDown(),
          const DropDivider(),
        ],
      ),
    );
  }
}
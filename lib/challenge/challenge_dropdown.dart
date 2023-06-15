import 'package:flutter/material.dart';
import 'package:wakeup/challenge/dropdown_divider.dart';
import 'package:wakeup/challenge/difficulty_slider.dart';
import 'package:wakeup/challenge/custom_checkbox.dart';
import 'package:wakeup/challenge/custom_dropdown.dart';

class ChallengeDropDownWidget extends StatelessWidget {
  const ChallengeDropDownWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: ListView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.fromLTRB(16, 40, 16, 16),
        shrinkWrap: true,
        children: const [
          DropDivider(),
          Text(
            "Difficulty",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18,
              color: Color(0xff000000),
            ),
          ),
          DifficultySlider(),
          DropDivider(),
          CustomCheckBox(),
          DropDivider(),
          CustomDropDown(),
          DropDivider(),
        ],
      ),
    );
  }
}

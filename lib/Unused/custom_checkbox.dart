import 'package:flutter/material.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CustomCheckBoxState createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool _currentCheckboxValue = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
      child: CheckboxListTile(
        value: _currentCheckboxValue,
        title: const Text(
          "Allow: New problem",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
            color: Color(0xff000000),
          ),
          textAlign: TextAlign.left,
        ),
        tileColor: const Color(0x1fffffff),
        activeColor: const Color(0xff3a57e8),
        checkColor: const Color(0xffffffff),
        onChanged: (value) {
          setState(() {
            _currentCheckboxValue = value!;
          });
        },
      
        secondary: const Icon(Icons.wb_incandescent_outlined,
            color: Color(0xff212435), size: 24),
      ),
    );
  }
}

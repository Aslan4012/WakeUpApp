import 'package:flutter/material.dart';

class HeaderButtons extends StatelessWidget {
  final String title;
  final VoidCallback onCancel;
  final VoidCallback onSave;

  const HeaderButtons({
    Key? key,
    required this.title,
    required this.onCancel,
    required this.onSave,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 26, color: Colors.black),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: onCancel,
              child: const Text(
                "Cancel",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, color: Colors.black),
              ),
            ),
            TextButton(
              onPressed: onSave,
              child: const Text(
                "Save",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, color: Colors.black),
              ),
            ),
          ],
        ),
      ],
    );
  }
}



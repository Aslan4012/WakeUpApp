import 'package:flutter/material.dart';

class AlarmTile extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  final void Function()? onDismissed;
  final bool isLocked;

  const AlarmTile({
    Key? key,
    required this.title,
    this.onPressed,
    this.onDismissed,
    required this.isLocked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: key!,
      direction: onDismissed != null
          ? DismissDirection.endToStart
          : DismissDirection.none,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 30),
        child: const Icon(
          Icons.delete,
          size: 30,
          color: Colors.white,
        ),
      ),
      onDismissed: (_) => onDismissed?.call(),
      child: RawMaterialButton(
        onPressed: isLocked ? null : onPressed,
        child: Container(
          height: 100,
          padding: const EdgeInsets.all(35),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.alarm, size: 35),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                ),
              ),
              isLocked ? Container() : const Icon(Icons.keyboard_arrow_right_rounded, size: 35),
            ],
          ),
        ),
      ),
    );
  }
}


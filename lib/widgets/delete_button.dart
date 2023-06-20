import 'package:flutter/material.dart';

class DeleteButton extends StatelessWidget {
  final VoidCallback onDelete;

  const DeleteButton({Key? key, required this.onDelete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onDelete,
      child: Text(
        'Delete Alarm',
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(color: Colors.red),
      ),
    );
  }
}

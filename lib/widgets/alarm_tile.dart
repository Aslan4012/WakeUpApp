import 'package:flutter/material.dart';

class AlarmTile extends StatelessWidget {
  final String title;
  final Function()? onPressed;
  final Function(DismissDirection)? onDismissed;

  const AlarmTile({
    Key? key,
    required this.title,
    this.onPressed,
    this.onDismissed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: key!,
      direction: DismissDirection.startToEnd,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 30),
        child: const Icon(
          Icons.delete,
          size: 30,
          color: Colors.white,
        ),
      ),
      confirmDismiss: (direction) async {
        final confirm = await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Confirm"),
              content:
                  const Text("Are you sure you want to delete this alarm?"),
              actions: <Widget>[
                TextButton(
                  child: const Text("CANCEL"),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                ),
                TextButton(
                  child: const Text("DELETE"),
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                ),
              ],
            );
          },
        );
        if (confirm == true) {
          onDismissed?.call(direction);
        }
        return confirm;
      },
      child: RawMaterialButton(
        onPressed: onPressed,
        child: Container(
          height: 100,
          padding: const EdgeInsets.all(35),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.alarm, size: 35),
              Expanded(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Icon(Icons.keyboard_arrow_right_rounded, size: 35),
            ],
          ),
        ),
      ),
    );
  }
}

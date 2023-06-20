import 'package:flutter/material.dart';

class TimePickerButton extends StatelessWidget {
  final TimeOfDay selectedTime;
  final Function(TimeOfDay) onTimePick;

  const TimePickerButton({
    Key? key,
    required this.selectedTime,
    required this.onTimePick,
  }) : super(key: key);

  Future<void> _pickTime(BuildContext context) async {
    final res = await showTimePicker(
      initialTime: selectedTime,
      context: context,
    );
    if (res != null) onTimePick(res);
  }

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () => _pickTime(context),
      fillColor: Colors.grey[200],
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Text(
          selectedTime.format(context),
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(color: Colors.blueAccent),
        ),
      ),
    );
  }
}

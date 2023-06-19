import 'package:flutter/material.dart';
import 'package:alarm/alarm.dart';
import 'package:softwareprojekt/widgets/challenge_dropdown.dart';
import '../globaldata/global_data.dart';
import '../widgets/delete_button.dart';
import '../widgets/header_buttons.dart';
import '../widgets/setting_switch.dart';
import '../widgets/sound_dropdown.dart';
import '../widgets/time_picker.dart';

class EditAlarmScreen extends StatefulWidget {
  final AlarmSettings? alarmSettings;

  const EditAlarmScreen({Key? key, this.alarmSettings}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _EditAlarmScreenState createState() => _EditAlarmScreenState();
}

class _EditAlarmScreenState extends State<EditAlarmScreen> {
  late bool creating;
  late TimeOfDay selectedTime;
  late bool loopAudio;
  late bool vibrate;
  late bool showNotification;
  late String assetAudio;
  late String challenge;

  @override
  void initState() {
    super.initState();
    creating = widget.alarmSettings == null;

    if (creating) {
      final dt = DateTime.now().add(const Duration(minutes: 1));
      selectedTime = TimeOfDay(hour: dt.hour, minute: dt.minute);
      loopAudio = true;
      vibrate = true;
      showNotification = true;
      assetAudio = 'assets/mozart.mp3';
      challenge = 'Math';
    } else {
      selectedTime = TimeOfDay(
        hour: widget.alarmSettings!.dateTime.hour,
        minute: widget.alarmSettings!.dateTime.minute,
      );
      loopAudio = widget.alarmSettings!.loopAudio;
      vibrate = widget.alarmSettings!.vibrate;
      showNotification = widget.alarmSettings!.notificationTitle != null &&
          widget.alarmSettings!.notificationTitle!.isNotEmpty &&
          widget.alarmSettings!.notificationBody != null &&
          widget.alarmSettings!.notificationBody!.isNotEmpty;
      assetAudio = widget.alarmSettings!.assetAudioPath;
      challenge = GlobalData().alarmChallenges[widget.alarmSettings!.id] ?? 'Math';
    }
  }

  void _onTimePick(TimeOfDay time) {
    setState(() {
      selectedTime = time;
    });
  }

  void _onSoundChanged(String sound) {
    setState(() {
      assetAudio = sound;
    });
  }

  void _onChallengeChanged(String newChallenge) {
  setState(() {
    challenge = newChallenge;
    if (!creating) {
      // if not creating, we have an existing alarm
      GlobalData().alarmChallenges[widget.alarmSettings!.id] = newChallenge;
    }
  });
}

  void _onLoopAudioChanged(bool value) {
    setState(() {
      loopAudio = value;
    });
  }

  void _onVibrateChanged(bool value) {
    setState(() {
      vibrate = value;
    });
  }

  void _onShowNotificationChanged(bool value) {
    setState(() {
      showNotification = value;
    });
  }

  AlarmSettings _buildAlarmSettings() {
    final now = DateTime.now();
    final id = creating
        ? DateTime.now().millisecondsSinceEpoch % 100000
        : widget.alarmSettings!.id;

    DateTime dateTime = DateTime(
      now.year,
      now.month,
      now.day,
      selectedTime.hour,
      selectedTime.minute,
      0,
      0,
    );
    if (dateTime.isBefore(DateTime.now())) {
      dateTime = dateTime.add(const Duration(days: 1));
    }

    final alarmSettings = AlarmSettings(
      id: id,
      dateTime: dateTime,
      loopAudio: loopAudio,
      vibrate: vibrate,
      notificationTitle: showNotification ? 'Alarm example' : null,
      notificationBody: showNotification ? 'Your alarm ($id) is ringing' : null,
      assetAudioPath: assetAudio,
      stopOnNotificationOpen: false,
    );
    return alarmSettings;
  }

  void _saveAlarm() {
    final alarmSettings = _buildAlarmSettings();
    Alarm.set(alarmSettings: alarmSettings).then((res) {
      if (res) {
        GlobalData().alarmChallenges[alarmSettings.id] = challenge;
        Navigator.pop(context, true);
        
        // ignore: avoid_print, for TESTING...
        print('SETTING ALARM: Challenge for alarm with id: ${alarmSettings.id} set to: ${GlobalData().alarmChallenges[alarmSettings.id]}');
      }
    });
  }

  void _deleteAlarm() {
    Alarm.stop(widget.alarmSettings!.id).then((res) {
      if (res) {
        int testvariable = widget.alarmSettings!.id;
        // ignore: avoid_print, for TESTING...
        print('Deleting alarm with id $testvariable, challenge: ${GlobalData().alarmChallenges[testvariable]}');

        //Our functionality
        GlobalData().alarmChallenges.remove(widget.alarmSettings!.id);
        Navigator.pop(context, true);
        
        // ignore: avoid_print, for TESTING...
        print('challenge at $testvariable is null: ' + '${GlobalData().alarmChallenges[testvariable] == null}');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HeaderButtons(title: creating ? 'Create Alarm' :  'Editing Alarm', 
            onCancel: () => Navigator.pop(context, false), 
            onSave: _saveAlarm
          ),
          TimePickerButton(selectedTime: selectedTime, onTimePick: _onTimePick),
          SoundDropdown(value: assetAudio, onChanged: _onSoundChanged),
          ChallengeDropdown(value: challenge, onChanged: _onChallengeChanged),
          SettingSwitch(title: 'Loop alarm audio', value: loopAudio, onChanged: _onLoopAudioChanged),
          SettingSwitch(title: 'Vibrate', value: vibrate, onChanged: _onVibrateChanged),
          SettingSwitch(title: 'Show notification', value: showNotification, onChanged: _onShowNotificationChanged),
          if (!creating)
            DeleteButton(onDelete: _deleteAlarm),
          const SizedBox(),
        ],
      ),
    );
  }
}

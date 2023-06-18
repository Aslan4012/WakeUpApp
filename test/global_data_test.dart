import 'package:flutter_test/flutter_test.dart';
import 'package:softwareprojekt/globaldata/global_data.dart';
import 'package:alarm/alarm.dart';

void main() {
  group('GlobalData', () {
    late GlobalData globalData;
    late AlarmSettings alarmSettings;
    const challenge = 'Math';

    setUp(() {
      globalData = GlobalData();
      alarmSettings = AlarmSettings(
        id: DateTime.now().millisecondsSinceEpoch % 100000,
        dateTime: DateTime.now(),
        loopAudio: false,
        vibrate: false,
        notificationTitle: 'Alarm example',
        notificationBody: 'Your alarm is ringing',
        assetAudioPath: 'assets/mozart.mp3',
        stopOnNotificationOpen: false,
      );
      globalData.alarmChallenges[alarmSettings.id] = challenge;
    });

    test('store challenge data', () {
      expect(globalData.alarmChallenges[alarmSettings.id], challenge);
    });

    test('update challenge data', () {
      const newChallenge = 'New Math';
      globalData.alarmChallenges[alarmSettings.id] = newChallenge;
      expect(globalData.alarmChallenges[alarmSettings.id], newChallenge);
    });

    test('delete challenge data', () {
      globalData.alarmChallenges.remove(alarmSettings.id);
      expect(globalData.alarmChallenges[alarmSettings.id], null);
    });
  });
}

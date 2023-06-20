import 'package:flutter/material.dart';
import 'package:shake/shake.dart';
import 'package:alarm/alarm.dart';
import '../alarmscreens/alarm_screen.dart';
import '../globaldata/global_data.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ShakeScreen extends StatefulWidget {
  final int alarmId;

  const ShakeScreen({Key? key, required this.alarmId}) : super(key: key);

  @override
  State<ShakeScreen> createState() => _ShakeScreenState();
}

class _ShakeScreenState extends State<ShakeScreen> {
  var shakeCount = 0;

  void shakeIncrementer() {
    setState(() {
      shakeCount++;
    });
  }

  @override
  void initState() {
    super.initState();
    ShakeDetector.autoStart(
      onPhoneShake: () {
        shakeIncrementer();
        if (shakeCount >= 30) {
          GlobalData().showAnimation = true;
          Alarm.stop(widget.alarmId).then((_) {
            Navigator.pop(context);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AlarmScreen()));
          });
        }
      },
      minimumShakeCount: 1,
      shakeSlopTimeMS: 375,
      shakeCountResetTime: 3000,
      shakeThresholdGravity: 2.7,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'SHAKE THE PHONE!',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            CircularPercentIndicator(
              radius: 100,
              lineWidth: 20,
              percent: shakeCount / 30,
              progressColor: Colors.deepPurple,
              center: Text(
                'Shakes: $shakeCount',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

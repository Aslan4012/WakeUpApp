import 'package:flutter/material.dart';
import 'package:alarm/alarm.dart';
import '../alarmscreens/alarm_screen.dart';
import '../globaldata/global_data.dart';
import '../widgets/spin_Button.dart';
import 'dart:async';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:percent_indicator/percent_indicator.dart';

class SpinScreen extends StatefulWidget {
  final int alarmId;

  const SpinScreen({Key? key, required this.alarmId}) : super(key: key);

  @override
  State<SpinScreen> createState() => _SpinScreenState();
}

class _SpinScreenState extends State<SpinScreen> {
  double sumz = 0;
  double absumz = 0;
  double remaining = 3000;
  StreamSubscription<GyroscopeEvent>? gyroscopeStreamSubscription;
  bool isButtonVisible = true;
  bool isTextVisible = false;

  void startSpinning() {
    setState(() {
      isButtonVisible = false;
      isTextVisible = true;
    });

    gyroscopeStreamSubscription =
        gyroscopeEvents.listen((GyroscopeEvent event) {
      var z = event.z;
      bool isStationary = z.abs() < 0.1;
      if (!isStationary) {
        setState(() {
          // Calculate rotation in degrees
          sumz = sumz + (z / 2);
          absumz = sumz.abs();
          remaining = 3000 - sumz;
        });
      }

      if (sumz.abs() >= 3000) {
        gyroscopeStreamSubscription?.cancel();
        GlobalData().showAnimation = true;
        Alarm.stop(widget.alarmId).then((_) {
          Navigator.pop(context);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AlarmScreen()));
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Spin Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinButton(
                title: 'Start Spinning',
                isVisible: isButtonVisible,
                onStartSpinning: startSpinning),
            SizedBox(height: 20),
            Visibility(
              visible: isTextVisible,
              child: CircularPercentIndicator(
                radius: 100,
                lineWidth: 20,
                percent: sumz.abs() / 3000,
                progressColor: Colors.deepPurple,
                center: Text(
                  'Degrees: ${absumz.toStringAsFixed(0)}',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              // child: Padding(
              //   padding: const EdgeInsets.all(30.0),
              //   child: Text(
              //     'You have spun ${sumz.toStringAsFixed(0)} degrees! Reach either 3000 or -3000 to stop!',
              //     style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              //   ),
              // ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    gyroscopeStreamSubscription?.cancel();
  }
}

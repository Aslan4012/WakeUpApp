import 'dart:math';

import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';

import '../alarmscreens/alarm_screen.dart';
import '../globaldata/global_data.dart';

class WalkScreen extends StatefulWidget {
  final int alarmId;
  const WalkScreen({Key? key, required this.alarmId}) : super(key: key);

  @override
  State<WalkScreen> createState() => _WalkScreenState();
}

class _WalkScreenState extends State<WalkScreen> {
  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;
  String _status = '?';
  late int _steps;
  int targetSteps = 0;

  @override
  void initState() {
    super.initState();
    targetSteps = generateRandomTargetSteps();
    initPlatformState();
  }

  int generateRandomTargetSteps() {
    final random = Random();
    return random.nextInt(30) + 10; // Generates et tal mellem 10 og 40
  }

  void onStepCount(StepCount event) {
    setState(() {
      _steps = event.steps;
      print(_steps);
    });
    if (_steps >= targetSteps) {
      result();
    }
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    setState(() {
      _status = event.status;
    });
  }

  void onPedestrianStatusError(error) {
    setState(() {
      _status = 'Pedestrian Status not available';
    });
  }

  void onStepCountError(error) {
    setState(() {
      _steps = -1;
    });
  }

  void initPlatformState() {
    _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
    _pedestrianStatusStream
        .listen(onPedestrianStatusChanged)
        .onError(onPedestrianStatusError);

    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(onStepCount).onError(onStepCountError);

    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Pedometer'),
            const SizedBox(height: 4),
            Text(
              'Target Steps: $targetSteps',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/BackgroundChallenge.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Steps taken:',
                style: TextStyle(fontSize: 30),
              ),
              Text(
                _steps >= 0 ? _steps.toString() : 'Step Count not available',
                style: const TextStyle(fontSize: 30),
              ),
              const Divider(
                height: 100,
                thickness: 0,
                color: Colors.white,
              ),
              const Text(
                'Pedestrian status:',
                style: TextStyle(fontSize: 30),
              ),
              Icon(
                _status == 'walking'
                    ? Icons.directions_walk
                    : _status == 'stopped'
                        ? Icons.accessibility_new
                        : Icons.error,
                size: 100,
              ),
              Center(
                child: Text(
                  _status,
                  style: _status == 'walking' || _status == 'stopped'
                      ? const TextStyle(fontSize: 30)
                      : const TextStyle(fontSize: 20, color: Colors.red),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void result() {
    if (_steps >= targetSteps) {
      GlobalData().showAnimation = true;
      Alarm.stop(widget.alarmId).then((_) {
        Navigator.pop(context);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => AlarmScreen()));
      });
    }
  }
}

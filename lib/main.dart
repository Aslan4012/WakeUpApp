//Top requirements for the import statements is the support for asynchronous programming, 
import 'dart:async';
import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'screens/alarm_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await requestAlarmPermission();
  await Alarm.init(showDebugLogs: true);

  runApp(const AlarmApp());
}

Future<void> requestAlarmPermission() async {
  var status = await Permission.ignoreBatteryOptimizations.status;
  if (status.isDenied) {
    // We didn't ask for permission yet.
    await Permission.ignoreBatteryOptimizations.request();
  }
}

class AlarmApp extends StatelessWidget {
  const AlarmApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alarm App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AlarmHomePage(),
      navigatorKey: navigatorKey,
    );
  }
}

class AlarmHomePage extends StatefulWidget {
  const AlarmHomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AlarmHomePageState createState() => _AlarmHomePageState();
}

class _AlarmHomePageState extends State<AlarmHomePage> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AlarmScreen(),
    );
  }
}


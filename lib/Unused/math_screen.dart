import 'package:flutter/material.dart';
import '../mathscreens/math_challenge.dart';

class MathChallengeScreen extends StatelessWidget {
  final int alarmId;

  const MathChallengeScreen({Key? key, required this.alarmId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Math')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 3 / 2,
          children: [
            challengeButton(context, 'x + y', Colors.blue, Icons.add, AddMathChallenge(alarmId: alarmId)),
            //challengeButton(context, 'x * y', Colors.red, Icons.clear, Multiply(alarmId: alarmId)),
            //challengeButton(context, 'x / y', Colors.green, Icons.e_mobiledata, Divide(alarmId: alarmId)),
          ],
        ),
      ),
    );
  }

  Widget challengeButton(BuildContext context, String label, Color color, IconData icon, Widget targetScreen) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => targetScreen,
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.all(16.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 36),
          const SizedBox(height: 16.0),
          Text(
            label,
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
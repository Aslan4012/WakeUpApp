import 'dart:math';

import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';
import '../alarmscreens/alarm_screen.dart';
import '../globaldata/global_data.dart';
import '../screens/const.dart';

const textAll = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 30,
);

class AddMathChallenge extends StatefulWidget {
  const AddMathChallenge({Key? key, required this.alarmId}) : super(key: key);
  final int alarmId;

  @override
  _AddMathChallengeState createState() => _AddMathChallengeState();
}

class _AddMathChallengeState extends State<AddMathChallenge> {
  List<String> calculatorKeys = [
    '7','8','9','0','4','5','6','C','1','2','3','=',
  ];

  String answer = '';
  var numGen = Random();
  int num1 = 0;
  int num2 = 0;

  @override
  void initState() {
    super.initState();
    generateRandomNumbers();
  }

  void buttonspressed(String button) {
    setState(() {
      if (button == 'C') {
        answer = ''; 
      } else if (button == '=') {
        result();
      } else if (answer.length < 5) {
        answer += button; 
      }
    });
  }

  void result() {
  try {
    if (int.parse(answer) == num1 + num2) {
      GlobalData().showAnimation = true;
      Alarm.stop(widget.alarmId).then((_) {
        Navigator.pop(context);
        Navigator.push(context, MaterialPageRoute(builder: (context) => AlarmScreen()));
      });
      dialogBox('Correct', nextQ, context);
    } else {
      dialogBox('Incorrect', nextQ, context);
    }
  } catch (e) {
    dialogBox('Invalid input', nextQ, context);
  }
}

  void generateRandomNumbers() {
    setState(() {
      num1 = numGen.nextInt(100);
      num2 = numGen.nextInt(100);
    });
  }

  void nextQ() {
    Navigator.of(context).pop();
    setState(() {
      answer = '';
    });
    generateRandomNumbers();
  }

  void dialogBox(String text, VoidCallback nextQ, BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.blueAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          content: Container(
            height: 200,
            color: Colors.blueAccent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: textAll,
                ),
                GestureDetector(
                  onTap: nextQ,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.arrow_forward, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(header: 'Plus'),
      body: Stack(
        children: [
          backGround(),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 100, 
                horizontal: 24.0, 
              ),
              child: FractionallySizedBox(
                widthFactor: 0.8,
                heightFactor: 0.3, 
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    color: Colors.blue[300],
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '$num1 + $num2 = ',
                            style: textAll,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                              width: 100,
                              height: 50,
                              color: const Color.fromARGB(127, 11, 11, 222),
                              child: Center(
                                child: Text(
                                  answer,
                                  style: textAll,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 50, 
                horizontal: 24.0,
              ),
              child: FractionallySizedBox(
                widthFactor: 1, 
                heightFactor: 0.41,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    color: Colors.blue[300],
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GridView.builder(
                          itemCount: calculatorKeys.length,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                          ),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8),
                              child: GestureDetector(
                                onTap: () => buttonspressed(calculatorKeys[index]),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(127, 11, 11, 222),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: Text(
                                      calculatorKeys[index],
                                      style: textAll,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

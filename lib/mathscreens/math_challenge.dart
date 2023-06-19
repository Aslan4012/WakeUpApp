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

class MathChallenge extends StatefulWidget {
  const MathChallenge({Key? key, required this.alarmId, required this.chosen})
      : super(key: key);
  final int alarmId;
  final String chosen;

  @override
  _MathChallengeState createState() => _MathChallengeState();
}

class _MathChallengeState extends State<MathChallenge> {
  List<String> calculatorKeys = [
    '7',
    '8',
    '9',
    '0',
    '4',
    '5',
    '6',
    'C',
    '1',
    '2',
    '3',
    '=',
  ];

  String answer = '';
  var numGen = Random();
  late int num1;
  late int num2;
  late int result;
  String operatorSymbol = '';

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
        checkResult();
      } else if (answer.length < 5) {
        answer += button;
      }
    });
  }

  void checkResult() {
    try {
      if (int.parse(answer) == result) {
        GlobalData().showAnimation = true;
        Alarm.stop(widget.alarmId).then((_) {
          Navigator.pop(context);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AlarmScreen()));
        });
      } else {
        dialogBox('Incorrect', nextQ, context);
      }
    } catch (e) {
      dialogBox('Invalid input', nextQ, context);
    }
  }

  void generateRandomNumbers() {
    setState(() {
      switch (widget.chosen) {
        case "add":
          operatorSymbol = "+";
          num1 = numGen.nextInt(100);
          num2 = numGen.nextInt(100);
          result = num1 + num2;
          break;

        case "minus":
          operatorSymbol = "-";
          num1 = numGen.nextInt(100);
          num2 = numGen.nextInt(100);
          // Ensure num1 is always greater or equal to num2... No negative results.
          if (num1 < num2) {
            int temp = num1;
            num1 = num2;
            num2 = temp;
          }
          result = num1 - num2;
          break;

        case "multiply":
          operatorSymbol = "*";
          num1 = numGen.nextInt(16); // 0 to 15
          num2 = numGen.nextInt(16);
          result = num1 * num2;
          break;

        //Ensure no division by zero, ensure that result is a whole number:
        //Num 2 is randomly chosen and num1 is a product of num 2 and another random number. Result will be a whole number...
        case "divide":
          operatorSymbol = "/";
          num2 = numGen.nextInt(10) + 1;
          num1 = num2 * (numGen.nextInt(10) + 1);
          result = num1 ~/ num2;
          break;

        default:
          operatorSymbol = "+";
          num1 = numGen.nextInt(100);
          num2 = numGen.nextInt(100);
          result = num1 + num2;
      }
    });
  }

  void nextQ() {
    Navigator.of(context).pop();
    setState(() {
      answer = '';
    });
    generateRandomNumbers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(header: 'Math Challenge'),
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
                            '$num1 $operatorSymbol $num2 = ',
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
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                          ),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8),
                              child: GestureDetector(
                                onTap: () =>
                                    buttonspressed(calculatorKeys[index]),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(127, 11, 11, 222),
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

import 'dart:math';

import 'package:flutter/material.dart';
import 'const.dart';

const textAll = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 30,
);

void main() {
  runApp(const Math());
}

class MathPlus extends StatefulWidget {
  const MathPlus({Key? key}) : super(key: key);

  @override
  _MathPlusState createState() => _MathPlusState();
}

class _MathPlusState extends State<MathPlus> {
  List<String> lommeregner = [
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
  int a = 0;
  int b = 0;

  @override
  void initState() {
    super.initState();
    generateRandomNumbers();
  }

  void buttonspressed(String button) {
    setState(() {
      if (button == 'C') {
        answer = ''; // Clear the answer if 'C' button is pressed
      } else if (button == '=') {
        result();
      } else if (answer.length < 5) {
        answer += button; // Append the pressed button to the answer string
      }
    });
  }

  void result() {
    if (int.parse(answer) == a + b) {
      dialogBox('Correct', nextQ, context);
    } else {
      dialogBox('Incorrect', nextQ, context);
    }
  }

  void generateRandomNumbers() {
    setState(() {
      a = numGen.nextInt(100);
      b = numGen.nextInt(100);
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
                vertical: 100, // Vertical padding
                horizontal: 24.0, // Horizontal padding
              ),
              child: FractionallySizedBox(
                widthFactor:
                    0.8, // Adjust this value to control the width of the widget
                heightFactor: 0.3, // Set the height as 2/3 of the screen
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    color: Colors.blue[300],
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '$a + $b = ',
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
                vertical: 50, // Vertical padding
                horizontal: 24.0, // Horizontal padding
              ),
              child: FractionallySizedBox(
                widthFactor:
                    1, // Adjust this value to control the width of the widget
                heightFactor: 0.41, // Set the height as 2/3 of the screen
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                      20), // Set the desired border radius
                  child: Container(
                    color: Colors.blue[300], // Set the desired background color
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GridView.builder(
                          itemCount: lommeregner.length,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                          ),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8),
                              child: GestureDetector(
                                onTap: () => buttonspressed(lommeregner[index]),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(127, 11, 11, 222),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: Text(
                                      lommeregner[index],
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

class Math extends StatelessWidget {
  const Math({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MathPlus(),
    );
  }
}
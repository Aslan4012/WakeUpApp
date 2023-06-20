import 'package:flutter/material.dart';

import '../screens/const.dart';

class MathInput extends StatelessWidget {
  final int num1;
  final int num2;
  final String operatorSymbol;
  final String answer;
  final List<String> calculatorKeys = [
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

  MathInput({
    Key? key,
    required this.num1,
    required this.num2,
    required this.operatorSymbol,
    required this.answer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
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
    );
  }
}

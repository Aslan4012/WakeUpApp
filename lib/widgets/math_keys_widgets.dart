


import 'package:flutter/material.dart';

import '../screens/const.dart';


class MathKeys extends StatelessWidget {
  final void Function(String) onPressed;
  final List<String> calculatorKeys = [
    '7', '8', '9', '0', '4', '5', '6', 'C', '1', '2', '3', '=',
  ];

  MathKeys({
    Key? key,
    required this.onPressed,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Align(
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
                          onTap: () => onPressed(calculatorKeys[index]),
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
    );
  }
}

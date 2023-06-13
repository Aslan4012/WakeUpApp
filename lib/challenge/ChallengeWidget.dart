import 'package:flutter/material.dart';

class ChallengeWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  ChallengeWidget({
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.fromLTRB(60, 0, 0, 0),
        height: 70,
        
        decoration: BoxDecoration(
          color: Colors.lightBlue,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(12.0),
        ),

        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

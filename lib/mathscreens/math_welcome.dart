import 'package:flutter/material.dart';
import 'plus_screen.dart';

//import 'minus_screen.dart'; 
//import 'multiply_screen.dart';
//import 'divide_screen.dart';

class MathChallenges extends StatelessWidget {
  final int alarmId;

  const MathChallenges({Key? key, required this.alarmId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        centerTitle: true,
        leading: null,
        backgroundColor: Colors.black,
        title: Text(
          "Math Challenges",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: Colors.black,
          ),
        ),
      ),
      
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 16, 0, 20),
              child: Text(
                "Choose your challenge",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
            
            Column(
              children: [
                card(context, "Add", () => AddMathChallenge(alarmId: alarmId)),
                //card(context, "Subtract", () => MinusScreen(alarmId: alarmId)),
                //card(context, "Multiply", () => MultiplyScreen(alarmId: alarmId)),
                //card(context, "Divide", () => DivideScreen(alarmId: alarmId)),
              ],
            ),
          ],
        ),
      ),
    );
  }

    Widget card(BuildContext context, String title, Widget Function() createTargetScreen) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => createTargetScreen(),
        ),
      );
    },
      child: Card(
        margin: EdgeInsets.fromLTRB(0, 0, 0, 16),
        color: Color(0xffffffff),
        shadowColor: Color(0x4d939393),
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
          side: BorderSide(color: Color(0x4d9e9e9e), width: 1),
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(0),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xfff2f2f2),
                  shape: BoxShape.circle,
                ),
                child: Image(
                  image: NetworkImage("https://cdn0.iconfinder.com/data/icons/math-symbols-filled-line/614/7687_-_Math_Symbols_I-256.png"),
                  height: 40,
                  width: 40,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(0),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.zero,
                ),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xff000000),
                  size: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

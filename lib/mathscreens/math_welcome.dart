import 'package:flutter/material.dart';
import 'math_challenge.dart';

//import 'minus_screen.dart';
//import 'multiply_screen.dart';
//import 'divide_screen.dart';

class MathChallenges extends StatelessWidget {
  final int alarmId;

  const MathChallenges({Key? key, required this.alarmId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: AppBar(
        centerTitle: true,
        leading: null,
        backgroundColor: Colors.black,
        title: const Text(
          "Math Challenges",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Padding(
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
                card(context, "Add",
                    () => MathChallenge(alarmId: alarmId, chosen: "add")),
                card(
                    context,
                    "Subtract",
                    () => MathChallenge(
                          alarmId: alarmId,
                          chosen: "minus",
                        )),
                card(context, "Multiply",
                    () => MathChallenge(alarmId: alarmId, chosen: "multiply")),
                card(
                    context,
                    "Divide",
                    () => MathChallenge(
                          alarmId: alarmId,
                          chosen: "divide",
                        )),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget card(BuildContext context, String title,
      Widget Function() createTargetScreen) {
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
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 16),
        color: const Color(0xffffffff),
        shadowColor: const Color(0x4d939393),
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
          side: const BorderSide(color: Color(0x4d9e9e9e), width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.all(0),
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Color(0xfff2f2f2),
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/math_image.png',
                  fit: BoxFit.cover,
                  height: 60,
                  width: 60,
                  alignment: Alignment.center,
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.all(0),
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: Color(0xffffffff),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.zero,
                ),
                child: const Icon(
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

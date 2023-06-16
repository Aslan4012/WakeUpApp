import 'package:flutter/material.dart';
import '../challenge/challenge_dropdown.dart';
import '../challenge/challenge_widget.dart';

class ChallengeScreen extends StatelessWidget {
  const ChallengeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        title: const Text(
          "Challenges",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 24,
            color: Color(0xff000000),
          ),
        ),
      ),
      body: Stack(
        children: [
          IgnorePointer( 
            child: Image.asset(
              'assets/BackgroundChallenge.jpg',
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.center,
            ),
          ),
          ListView(
            padding: const EdgeInsets.fromLTRB(16, 80, 16, 16),
            children: const [
              ChallengeWidget(title: "Math", icon: Icons.psychology, dropdownWidget: ChallengeDropDownWidget()),
              ChallengeWidget(title: "Walk", icon: Icons.sports_handball, dropdownWidget: ChallengeDropDownWidget()),
              ChallengeWidget(title: "Spin", icon: Icons.refresh, dropdownWidget: ChallengeDropDownWidget()),
              ChallengeWidget(title: "Pokemon", icon: Icons.catching_pokemon, dropdownWidget: ChallengeDropDownWidget()), 
            ],
          ),
        ],
      ),
    );
  }
}


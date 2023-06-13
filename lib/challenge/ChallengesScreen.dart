import 'package:flutter/material.dart';
import 'ChallengeWidget.dart';

class ChallengeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),

        title: Text(
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
          Image.asset(
            'assets/BackgroundChallenge.jpg',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
          ),
          
          ListView(
            padding: EdgeInsets.fromLTRB(16, 80, 16, 16),
            physics: NeverScrollableScrollPhysics(),
            
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 16),
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    ChallengeWidget(
                      title: "Math",
                      onTap: () {
                        print("Math challenge tapped!");
                      },
                    ),
                    Image(
                      image: NetworkImage(
                          "https://cdn2.iconfinder.com/data/icons/circle-icons-1/64/calculator-256.png"),
                      height: 100,
                      width: 100,
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 16),
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    ChallengeWidget(
                      title: "Ryger Hash",
                      onTap: () {
                        print("Math challenge tapped!");
                      },
                    ),
                    Image(
                      image: NetworkImage(
                          "https://cdn2.iconfinder.com/data/icons/circle-icons-1/64/art-512.png"),
                      height: 100,
                      width: 100,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

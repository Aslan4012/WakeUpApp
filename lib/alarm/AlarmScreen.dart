
import 'package:flutter/material.dart';

import 'AlarmTile.dart';

class AlarmScreen extends StatefulWidget {
  @override
  _AlarmScreenState createState() => _AlarmScreenState();
}

class _AlarmScreenState extends State<AlarmScreen> {
  bool isLocked = true; // bool to check if the alarms are locked or not

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0x00ffffff),
        leading: IconButton(
          icon: Icon(isLocked ? Icons.lock : Icons.lock_open,
              color: Color(0xff212435), size: 24),
          onPressed: () {
            setState(() {
              isLocked = !isLocked; // isLocked is notted
            });
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add, color: Color(0xff212435), size: 24),
            onPressed: () {},
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            //Active alarms section
            Padding(
              padding: EdgeInsets.fromLTRB(0, 16, 0, 20),
              child: Text(
                "Active Alarms",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: Color(0xff000000),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: ListView(
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.all(0),
                physics: ScrollPhysics(),
                children: [
                  AlarmTile(title: "05:38", subtitle: "Walk"),
                  AlarmTile(title: "05:38", subtitle: "Walk"),
                  AlarmTile(title: "05:38", subtitle: "Walk"),
                  AlarmTile(title: "05:38", subtitle: "Walk"),
                  AlarmTile(title: "05:38", subtitle: "Walk"),
                  AlarmTile(title: "05:38", subtitle: "Walk"),
                  AlarmTile(title: "05:38", subtitle: "Walk"),
                ],
              ),
            ),

            //Inactive alarms section
            Padding(
              padding: EdgeInsets.fromLTRB(0, 16, 0, 20),
              child: Text(
                "Inactive Alarms",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: Color(0xff000000),
                ),
              ),
            ),     
            Expanded(
              flex: 1,
              child: ListView(
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.all(0),
                physics: ScrollPhysics(),
                children: [
                  AlarmTile(title: "05:38", subtitle: "Walk"),
                  AlarmTile(title: "05:38", subtitle: "Walk"),
                  AlarmTile(title: "05:38", subtitle: "Walk"),
                  AlarmTile(title: "05:38", subtitle: "Walk"),
                  AlarmTile(title: "05:38", subtitle: "Walk"),
                  AlarmTile(title: "05:38", subtitle: "Walk"),
                  AlarmTile(title: "05:38", subtitle: "Walk"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

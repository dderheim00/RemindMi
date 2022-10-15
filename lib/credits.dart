import 'package:flutter/material.dart';

class CreditsPage extends StatefulWidget {
  @override
  _CreditsPageState createState() => _CreditsPageState();
}

class _CreditsPageState extends State<CreditsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(24.0),
        child: Text("Created by Nikhil Adhikari, Daniel Derheim, Bishnu Sharma, and John West",
          textAlign: TextAlign.center,),
      ),
    );
  }
}
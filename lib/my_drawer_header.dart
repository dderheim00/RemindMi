import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class MyHeaderDrawer extends StatefulWidget {
  @override
  _MyHeaderDrawerState createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  final getStorge = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green[700],
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/remindmi_icon.png'),
              ),
            ),
          ),
          Text(
            (getStorge.read("fullName") != null ? (getStorge.read("fullName")) : ('')),
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Text(
            (getStorge.read("email") != null
                ? (getStorge.read("email"))
                : ('')),
            style: TextStyle(
              color: Colors.grey[200],
              fontSize: 14,
            ),
          ),
          Text(
            (getStorge.read("role") != null ? (getStorge.read("role")) : ('')),
            style: TextStyle(
              color: Colors.grey[200],
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/cupertino.dart';

class AccessibilityView extends StatefulWidget {
  const AccessibilityView({super.key});

  @override
  State<AccessibilityView> createState() => _AccessibilityViewState();
}

class _AccessibilityViewState extends State<AccessibilityView> {
  bool val1 = false;
  bool val2 = false;

  onChangeFunctionBT(bool newValue1) {
    setState(() {
      val1 = newValue1;
    });
  }

  onChangeFunctionTTS(bool newValue2) {
    setState(() {
      val2 = newValue2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              accSwitch('Bold text', val1, onChangeFunctionBT),
              accSwitch('Text-to-speech', val2, onChangeFunctionTTS)
            ],
          ),
        )
    );


  }

  Widget accSwitch(String text, bool val, Function onChangeMethod) {
    return Padding(
      padding: const EdgeInsets.only(top: 22.0, left: 16.0, right: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: TextStyle(
              fontSize: 20.0,
              color: Colors.black,
              fontWeight: FontWeight.w600
          )),
          Spacer(),
          CupertinoSwitch(
              trackColor: Colors.grey,
              activeColor: Colors.blue,
              value: val,
              onChanged: (newValue) {
                onChangeMethod(newValue);
              }
          )
        ],
      ),
    );
  }

}

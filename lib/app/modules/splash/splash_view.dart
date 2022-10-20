import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Splash View'),
      //   centerTitle: true,
      // ),

      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 255,
            ),
            Align(
              child: Image.asset(
                'assets/images/remindmi_icon.png',
                height: 100,
                width: 100,
              ),
            ),
            Text(
              'RemindMi',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 300,
            ),
            Text('V.1.0')
          ],
        ),
        //
      ),
    );
  }
}

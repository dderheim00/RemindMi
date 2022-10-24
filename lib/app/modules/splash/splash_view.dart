import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 307,
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
              style:
                  GoogleFonts.dmSans(fontSize: 30, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 246,
            ),
            Text(
              'V.1.0',
              style:
                  GoogleFonts.dmSans(fontSize: 22, fontWeight: FontWeight.w500),
            )
          ],
        ),
        //
      ),
    );
  }
}

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:remindmi/app/modules/forgotpassword/forgotpassword_controller.dart';

import 'package:remindmi/app/routes/app_pages.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPassword_view extends StatefulWidget {
  const ForgotPassword_view({super.key});

  @override
  State<ForgotPassword_view> createState() => _ForgotPassword_viewState();
}

class _ForgotPassword_viewState extends State<ForgotPassword_view> {
  ForgotPasswordController MyForgotPasswordController =
      Get.put(ForgotPasswordController());
  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController(text: '');
    TextEditingController _newpasswordController =
        TextEditingController(text: '');
    TextEditingController _confirmnewpasswordController =
        TextEditingController(text: '');
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 48,
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: new IconButton(
                onPressed: () {
                  Get.toNamed(Routes.LOGIN);
                },
                icon: Icon(Icons.arrow_back),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.fromLTRB(16, 0, 0, 0),
              child: Text(
                'Forgot',
                style: GoogleFonts.dmSans(
                    fontSize: 36.0, fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.fromLTRB(16, 0, 0, 0),
              child: Text(
                'Password',
                style: GoogleFonts.dmSans(
                    fontSize: 36.0, fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: 36,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Color.fromRGBO(238, 239, 241, 1),
                  borderRadius: BorderRadius.circular(8)),
              height: 60,
              width: 398,
              margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: TextField(
                style: GoogleFonts.dmSans(
                    fontSize: 20, fontWeight: FontWeight.w500),
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Email ID",
                    prefixIcon: Icon(
                      Icons.mail_outline,
                    )),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            // Container(
            //   decoration: BoxDecoration(
            //       color: Color.fromRGBO(238, 239, 241, 1),
            //       borderRadius: BorderRadius.circular(8)),
            //   height: 60,
            //   width: 398,
            //   margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
            //   child: TextField(
            //     style: GoogleFonts.dmSans(
            //         fontSize: 20, fontWeight: FontWeight.w500),
            //     keyboardType: TextInputType.emailAddress,
            //     controller: _newpasswordController,
            //     decoration: InputDecoration(
            //       border: InputBorder.none,
            //       hintText: "Password",
            //       prefixIcon: Container(
            //         child: Image.asset(
            //           'assets/images/password.png',
            //           height: 5,
            //           width: 5,
            //         ),
            //       ),
            //       suffixIcon: Container(
            //         child: Image.asset(
            //           'assets/images/eye.png',
            //           height: 1,
            //           width: 1,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: 12,
            // ),
            // Container(
            //   decoration: BoxDecoration(
            //       color: Color.fromRGBO(238, 239, 241, 1),
            //       borderRadius: BorderRadius.circular(8)),
            //   height: 60,
            //   width: 398,
            //   margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
            //   child: TextField(
            //     style: GoogleFonts.dmSans(
            //         fontSize: 20, fontWeight: FontWeight.w500),
            //     keyboardType: TextInputType.emailAddress,
            //     controller: _confirmnewpasswordController,
            //     decoration: InputDecoration(
            //       border: InputBorder.none,
            //       hintText: "Confirm Password",
            //       prefixIcon: Container(
            //         child: Image.asset(
            //           'assets/images/password.png',
            //           height: 5,
            //           width: 5,
            //         ),
            //       ),
            //       suffixIcon: Container(
            //         child: Image.asset(
            //           'assets/images/eye.png',
            //           height: 1,
            //           width: 1,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: 16,
            // ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
              width: 398,
              height: 60,
              child: Obx(
                () => RawMaterialButton(
                  fillColor: Color.fromRGBO(24, 90, 219, 1.0),
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  onPressed: () {
                    MyForgotPasswordController.sendResetLink(
                        _emailController.text);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (MyForgotPasswordController.isLoading.value ==
                          true) ...[
                        CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 1.5,
                        )
                      ],
                      Container(
                        // margin:
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Forgot Password",
                            style: GoogleFonts.dmSans(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),

            Container(
              child: RichText(
                text: TextSpan(
                  text: 'Already have an account? ',
                  style: GoogleFonts.dmSans(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(157, 163, 173, 1)),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Sign In',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.toNamed(Routes.LOGIN);
                          },
                        style: GoogleFonts.dmSans(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(24, 90, 219, 1))),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

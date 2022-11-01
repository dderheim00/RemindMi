import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remindmi/app/modules/signup/signup_controller.dart';
import 'package:remindmi/app/routes/app_pages.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  SignupController MySignupController = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    bool terms = false;
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    TextEditingController _confirmPasswordController = TextEditingController();
    TextEditingController _fullNameController = TextEditingController();
    TextEditingController _nameController = TextEditingController();

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
                    Get.toNamed(Routes.LANDINGPAGE);
                  },
                  icon: Icon(Icons.arrow_back))),
          SizedBox(
            height: 16,
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.fromLTRB(16, 0, 0, 0),
            child: Text(
              'Create',
              style: GoogleFonts.dmSans(
                  fontSize: 36.0, fontWeight: FontWeight.w700),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.fromLTRB(16, 0, 0, 0),
            child: Text(
              'your account',
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
              style:
                  GoogleFonts.dmSans(fontSize: 20, fontWeight: FontWeight.w500),
              keyboardType: TextInputType.emailAddress,
              controller: _fullNameController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Full Name",
                prefixIcon: Icon(
                  Icons.person_outline_outlined,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            decoration: BoxDecoration(
                color: Color.fromRGBO(238, 239, 241, 1),
                borderRadius: BorderRadius.circular(8)),
            height: 60,
            width: 398,
            margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: TextField(
              style:
                  GoogleFonts.dmSans(fontSize: 20, fontWeight: FontWeight.w500),
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Email ID",
                prefixIcon: Icon(
                  Icons.mail_outline,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            decoration: BoxDecoration(
                color: Color.fromRGBO(238, 239, 241, 1),
                borderRadius: BorderRadius.circular(8)),
            height: 60,
            width: 398,
            margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: Obx(
              () => TextField(
                style: GoogleFonts.dmSans(
                    fontSize: 20, fontWeight: FontWeight.w500),
                // keyboardType: TextInputType.emailAddress,
                controller: _passwordController,
                obscureText: (MySignupController.passwordVisibility.value),
                // onChanged: ((value) {
                //   MySignupController.can ();
                // }),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Password",
                  prefixIcon: Icon(Icons.key_outlined),
                  suffixIcon: InkWell(
                    child: Icon(MySignupController.passwordVisibility.value
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined),
                    onTap: () {
                      MySignupController.passwordVisibility.value =
                          !MySignupController.passwordVisibility.value;
                    },
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            decoration: BoxDecoration(
                color: Color.fromRGBO(238, 239, 241, 1),
                borderRadius: BorderRadius.circular(8)),
            height: 60,
            width: 398,
            margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: Obx(
              () => TextField(
                style: GoogleFonts.dmSans(
                    fontSize: 20, fontWeight: FontWeight.w500),
                // keyboardType: TextInputType.emailAddress,
                controller: _confirmPasswordController,
                obscureText: (MySignupController.cPasswordVisibility.value),
                // onChanged: ((value) {
                //   MySignupController.ToggleCPasswordVisibility();
                // }),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Confirm Password",
                  prefixIcon: Icon(Icons.key_outlined),
                  suffixIcon: InkWell(
                    child: Icon(MySignupController.cPasswordVisibility.value
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined),
                    onTap: () {
                      MySignupController.cPasswordVisibility.value =
                          !MySignupController.cPasswordVisibility.value;
                    },
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Obx(
            () => Container(
              alignment: Alignment.bottomLeft,
              child: CheckboxListTile(
                checkboxShape: CircleBorder(),
                title: RichText(
                  text: TextSpan(
                    text: 'I agree to privacy ',
                    style: GoogleFonts.dmSans(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(255, 0, 0, 0)),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'policy & terms',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            showModalBottomSheet<void>(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              context: context,
                              builder: (BuildContext context) {
                                return SingleChildScrollView(
                                    child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: new BorderRadius.only(
                                          topLeft: const Radius.circular(25.0),
                                          topRight:
                                              const Radius.circular(25.0))),
                                  child: Align(
                                    child: Column(
                                      children: <Widget>[
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Container(
                                            margin: EdgeInsets.fromLTRB(
                                                20, 19, 0, 0),
                                            child: Text(
                                              "Terms & Conditions",
                                              style: GoogleFonts.dmSans(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 18),
                                        Container(
                                          margin:
                                              EdgeInsets.fromLTRB(20, 0, 19, 0),
                                          child: Text(
                                            'This application agreement, hereafter referred to as “Agreement”, is the agreement between the development team and the user with respect to use of the application (“Software”). This software is deve for the sole purpose of accessing using the capabilities and developed by Nikhil Adhikari, Daniel Derheim, Bishnu Sharma, and John West. The development team will hereafter be referred to as the “Team”. Grant of License Subject to your compliance with the terms and conditions set forth within this agreement, the Team grants you a limited, non-exclusive, non-transferable license to install and use one copy of the Software on your mobile device services enabled via the Software.Restrictions on Use You may not: (i) copy, modify, translate, reverse engineer, decompile or disassemble the Software or create derivative works based thereon; (ii) install the Software onto a server so that it is accessible via a public network; (iii) share or permit other individuals/entities to use the Software, rent, lease or transfer the Software or rights to use it; or (iv) delete or modify any attributions, legal notices or other proprietary designations in the Software or part thereof. Any such forbidden use shall immediately and automatically terminate your license to use the Software, without derogating from any other remedies available to the Team at law or in equity. Title and Ownership The Software and any revisions, modifications, enhancements and/or derivatives of it are owned by the Team and/or its licensors. Compliance with the Law The Software is intended for use only in compliance with the law. You undertake to use the Software in accordance with all applicable laws, including all applicable export laws, restrictions and regulations and agree that you will not export, or allow the export or re-export of the Software in violation of any such laws, restrictions and/or regulations. Limitation of Liability Under no circumstances shall the Team be liable to you or any other person for any indirect, special, incidental, or consequential damages of any type including, without limitation, damages for loss of goodwill, business interruption, device failure or malfunction, loss of business profits, loss of data or business or financial information, procurement of substitute goods or services or any and all other commercial damages or losses. In no event shall the Team liability to you or any third party for any loss or damages exceed the amount paid by you to the Team for use of the software, even if the Team had been informed of the possibility of such damages, or for any claim by any other party. Termination /nYour right to use this Software, as well as this Agreement, terminates if you fail to comply with any part of this License Agreement. The Team may terminate this Agreement at any time. You may terminate this license at any time by stopping your use of and uninstalling the Software.',
                                            style: GoogleFonts.dmSans(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ));
                              },
                            );
                          },
                        style: GoogleFonts.dmSans(
                            fontSize: 15,
                            color: Color.fromRGBO(24, 90, 219, 1)),
                      ),
                    ],
                  ),
                ),
                controlAffinity: ListTileControlAffinity
                    .leading, // ListTileControlAffinity.trailing
                // selected: MySignupController.termChecked.value,
                value: MySignupController.termChecked.value,
                onChanged: (term) {
                  MySignupController.ToggleTermChecked();
                  // terms= MySignupController.termChecked.value;
                },
              ),
            ),
          ),
          SizedBox(
            height: 31,
          ),
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
                  MySignupController.signUp(
                      _fullNameController.text,
                      _emailController.text,
                      _passwordController.text,
                      _confirmPasswordController.text);
                  // Get.toNamed(Routes.LOGIN);
                  // if (MySignupController.isSuccess.value == true) {

                  //   MySignupController.isSuccess.value = false;
                  // }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (MySignupController.isLoading.value == true) ...[
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
                          "Sign up",
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
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(24, 90, 219, 1))),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:remindmi/app/modules/signup/signup_controller.dart';
import 'package:remindmi/app/routes/app_pages.dart';
import 'package:remindmi/utils/my_preferences.dart';

// import 'login_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({Key? key}) : super(key: key);


  // await Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    return Scaffold(
        body: FutureBuilder(
          // future: _initializefirebase(),
          builder: (context, snapshot) {
            // if (snapshot.connectionState == ConnectionState.done) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Child Reminder ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        "Registration",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 44.0,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 44.0,
                      ),
                      TextField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                            hintText: "User Email",
                            prefixIcon: Icon(Icons.mail, color: Colors.black)),
                      ),
                      const SizedBox(
                        height: 26.0,
                      ),
                      TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                            hintText: "User Password",
                            prefixIcon: Icon(Icons.lock, color: Colors.black)),
                      ),
                      Container(
                          alignment: Alignment.centerRight,
                          child: Text("Forgot Password?",
                              style: TextStyle(color: Colors.blue)),
                          margin: const EdgeInsets.symmetric(vertical: 10.0)),
                      const SizedBox(
                        height: 88.0,
                      ),
                      Container(
                        width: double.infinity,
                        child: RawMaterialButton(
                          fillColor: Color.fromARGB(255, 0, 0, 247),
                          elevation: 0.0,
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0)),
                          onPressed: () {
                            controller.signUp(_emailController.text,_passwordController.text ,'parent');
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ),
                      Container(
                          alignment: Alignment.center,
                          child: GestureDetector(
                            onTap: () {
                              Get.offAllNamed(Routes.SIGNUP);
                            },
                            child: Text("Don't Have An Account? Create One",
                                style: TextStyle(color: Colors.blue)),
                          )),
                    ],
                  ),
                ),
              );
            // }
            // return const Center(
            //   child: CircularProgressIndicator(),
            // );
          },
        ));
    // return MaterialApp(
    //   home: Homepage(),
    // );
  }
}
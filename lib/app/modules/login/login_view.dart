import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remindmi/app/routes/app_pages.dart';
// import 'dart:html';
import 'login_controller.dart';

class View extends StatefulWidget {
  const View({super.key});

  @override
  State<View> createState() => _ViewState();
}

class _ViewState extends State<View> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  Future<FirebaseApp> _initializefirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyBJz4fybK5xR2r1_T1swuyUoHjwpMlBFlw",
        appId: "1:808243495408:android:14882011ffcdebbbf21d35",
        messagingSenderId: "808243495408",
        projectId: "remender-c60c3",
      ),
    );
    print("###############################################");
    return firebaseApp;
  }

  // await Firebase.initializeApp();

  // Widget build(BuildContext context) {
  //   TextEditingController _emailController = TextEditingController();
  //   TextEditingController _passwordController = TextEditingController();
  //   return Scaffold(
  //       body: FutureBuilder(
  //     future: _initializefirebase(),
  //     builder: (context, snapshot) {
  //       if (snapshot.connectionState == ConnectionState.done) {
  //         return Center(
  //           child: Padding(
  //             padding: const EdgeInsets.all(16.0),
  //             child: Column(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 const Text(
  //                   "Child Reminder ",
  //                   style: TextStyle(
  //                     color: Colors.black,
  //                     fontSize: 28.0,
  //                     fontWeight: FontWeight.bold,
  //                   ),
  //                 ),
  //                 const Text(
  //                   "Login to connect",
  //                   style: TextStyle(
  //                       color: Colors.black,
  //                       fontSize: 44.0,
  //                       fontWeight: FontWeight.bold),
  //                 ),
  //                 const SizedBox(
  //                   height: 44.0,
  //                 ),
  //                 TextField(
  //                   controller: _emailController,
  //                   keyboardType: TextInputType.emailAddress,
  //                   decoration: const InputDecoration(
  //                       hintText: "User Email",
  //                       prefixIcon: Icon(Icons.mail, color: Colors.black)),
  //                 ),
  //                 const SizedBox(
  //                   height: 26.0,
  //                 ),
  //                 TextField(
  //                   controller: _passwordController,
  //                   obscureText: true,
  //                   decoration: const InputDecoration(
  //                       hintText: "User Password",
  //                       prefixIcon: Icon(Icons.lock, color: Colors.black)),
  //                 ),
  //                 Container(
  //                     alignment: Alignment.centerRight,
  //                     child: Text("Forgot Password?",
  //                         style: TextStyle(color: Colors.blue)),
  //                     margin: const EdgeInsets.symmetric(vertical: 10.0)),
  //                 const SizedBox(
  //                   height: 88.0,
  //                 ),
  //                 Container(
  //                   width: double.infinity,
  //                   child: RawMaterialButton(
  //                     fillColor: Color.fromARGB(255, 0, 0, 247),
  //                     elevation: 0.0,
  //                     padding: const EdgeInsets.symmetric(vertical: 20.0),
  //                     shape: RoundedRectangleBorder(
  //                         borderRadius: BorderRadius.circular(12.0)),
  //                     onPressed: () {
  //                       controller.login(_emailController.text,_passwordController.text );
  //                     },
  //                     child: const Text(
  //                       "Login",
  //                       style: TextStyle(
  //                         color: Colors.white,
  //                         fontSize: 18.0,
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //                 Container(
  //                     alignment: Alignment.center,
  //                     child: GestureDetector(
  //                       onTap: () {
  //                         Get.offAllNamed(Routes.SIGNUP);
  //                       },
  //                       child: Text("Don't Have An Account? Create One",
  //                           style: TextStyle(color: Colors.blue)),
  //                     )),
  //               ],
  //             ),
  //           ),
  //         );
  //       }
  //       return const Center(
  //         child: CircularProgressIndicator(),
  //       );
  //     },
  //   ));
  //   // return MaterialApp(
  //   //   home: Homepage(),
  //   // );
  // }

  @override
  Widget build(BuildContext context) {
    bool _obscureText = true;
    TextEditingController _emailController =
        TextEditingController(text: 'sandeepneupane225@gmail.com');
    TextEditingController _passwordController =
        TextEditingController(text: 'password');
    return Scaffold(body: FutureBuilder(
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
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(
                    'assets/images/remindmi_icon.png',
                    height: 100,
                    width: 100,
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: const Text(
                    "RemindMi",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  " Login to connect",
                  // textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      hintText: "User Email",
                      prefixIcon: Icon(Icons.mail, color: Colors.black)),
                ),
                SizedBox(
                  height: 26.0,
                ),
                TextField(
                  controller: _passwordController,
                  // obscureText: _obscureText,
                  decoration: const InputDecoration(
                    hintText: "User Password",

                    prefixIcon: Icon(Icons.lock, color: Colors.black),
                    // suffixIcon: GestureDetector(
                    //   onTap: () {
                    //     setState((){
                    //       _obscureText = !_obscureText;
                    //     })
                    //   },
                    // ),
                    //  suffixIcon: GestureDetector(
                    //   onTap: () {
                    //     setState(() { _obscureText = !_obscureText;});
                    //   },
                    //   child: Icon(
                    //       _obscureText ? Icons.visibility : Icons.visibility_off),
                    // ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                    alignment: Alignment.centerRight,
                    child: Text("Forgot Password?",
                        style: TextStyle(color: Colors.blue)),
                    margin: const EdgeInsets.symmetric(vertical: 10.0)),
                const SizedBox(
                  height: 20.0,
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
                      controller.login(
                          _emailController.text, _passwordController.text);
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
                const SizedBox(
                  height: 27.0,
                ),
                Container(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.SIGNUP);
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

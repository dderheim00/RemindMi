import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remindmi/app/routes/app_pages.dart';

import 'login_controller.dart';

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
  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    return Scaffold(
        body: FutureBuilder(
      future: _initializefirebase(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
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
                    "Login to connect",
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
                        controller.login(_emailController.text,_passwordController.text );
                      },
                      // onPressed: () async {
                      //   User? user = await loginUsingEmailPassword(
                      //       email: _emailController.text,
                      //       password: _passwordController.text,
                      //       context: context);
                      //   // print(user?.email);
                      //   if (user != null) {
                      //     getStorge.write("id", user.uid);
                      //     getStorge.write("name", user.displayName);
                      //     getStorge.write("email", user.email);
                      //
                      //     // getStorge.write("name", "Ripples Code");
                      //     // getStorge.write("user", user);
                      //     // getStorge.read("id");
                      //     // myPrefs.setString('id', "1");
                      //     // print('stored id is :');
                      //     // print(myPrefs.getString("id"));
                      //     // print(getStorge.read('id'));
                      //     Get.offAllNamed(Routes.HOME);
                      //     // Navigator.of(context).pushReplacement(
                      //     //     MaterialPageRoute(builder: (context) => ProfileScreen()));
                      //   }
                      // },
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
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    ));
    // return MaterialApp(
    //   home: Homepage(),
    // );
  }
}
//
// class Homepage extends StatefulWidget {
//   const Homepage({super.key});
//
//   @override
//   State<Homepage> createState() => _HomepageState();
// }
//
// class _HomepageState extends State<Homepage> {
//   Future<FirebaseApp> _initializefirebase() async {
//     FirebaseApp firebaseApp = await Firebase.initializeApp();
//     return firebaseApp;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: FutureBuilder(
//           future: _initializefirebase(),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.done) {
//               return LoginScreen();
//             }
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           },
//         ));
//   }
// }
//
//
//   @override
//   Widget build(BuildContext context) {
// //creating the textfield controller
//     TextEditingController _emailController = TextEditingController();
//     TextEditingController _passwordController = TextEditingController();
//
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             "Child Reminder ",
//             style: TextStyle(
//               color: Colors.black,
//               fontSize: 28.0,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const Text(
//             "Login to connect",
//             style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 44.0,
//                 fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(
//             height: 44.0,
//           ),
//           TextField(
//             controller: _emailController,
//             keyboardType: TextInputType.emailAddress,
//             decoration: const InputDecoration(
//                 hintText: "User Email",
//                 prefixIcon: Icon(Icons.mail, color: Colors.black)),
//           ),
//           const SizedBox(
//             height: 26.0,
//           ),
//           TextField(
//             controller: _passwordController,
//             obscureText: true,
//             decoration: const InputDecoration(
//                 hintText: "User Password",
//                 prefixIcon: Icon(Icons.lock, color: Colors.black)),
//           ),
//           Container(
//               alignment: Alignment.centerRight,
//               child: Text("Forgot Password?",
//                   style: TextStyle(color: Colors.blue)),
//               margin: const EdgeInsets.symmetric(vertical: 10.0)),
//           const SizedBox(
//             height: 88.0,
//           ),
//           Container(
//             width: double.infinity,
//             child: RawMaterialButton(
//               fillColor: Color.fromARGB(255, 0, 0, 247),
//               elevation: 0.0,
//               padding: const EdgeInsets.symmetric(vertical: 20.0),
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12.0)),
//               onPressed: () {
//                 controller.login()
//               },
//               // onPressed: () async {
//               //   User? user = await loginUsingEmailPassword(
//               //       email: _emailController.text,
//               //       password: _passwordController.text,
//               //       context: context);
//               //   // print(user?.email);
//               //   if (user != null) {
//               //     getStorge.write("id", user.uid);
//               //     getStorge.write("name", user.displayName);
//               //     getStorge.write("email", user.email);
//               //
//               //     // getStorge.write("name", "Ripples Code");
//               //     // getStorge.write("user", user);
//               //     // getStorge.read("id");
//               //     // myPrefs.setString('id', "1");
//               //     // print('stored id is :');
//               //     // print(myPrefs.getString("id"));
//               //     // print(getStorge.read('id'));
//               //     Get.offAllNamed(Routes.HOME);
//               //     // Navigator.of(context).pushReplacement(
//               //     //     MaterialPageRoute(builder: (context) => ProfileScreen()));
//               //   }
//               // },
//               child: const Text(
//                 "Login",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 18.0,
//                 ),
//               ),
//             ),
//           ),
//           Container(
//               alignment: Alignment.center,
//               child: GestureDetector(
//                 // onTap: () {
//                 //   Navigator.of(context).pushReplacement(
//                 //       MaterialPageRoute(builder: (context) => Register()));
//                 // },
//                 child: Text("Don't Have An Account? Create One",
//                     style: TextStyle(color: Colors.blue)),
//               )),
//         ],
//       ),
//     );
//   }
// }

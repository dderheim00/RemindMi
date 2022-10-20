import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

// import 'app/routes/app_pages.dart';

import 'package:remindmi/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  await GetStorage.init();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  // FirebaseApp firebaseApp = await Firebase.initializeApp(
  //   options: const FirebaseOptions(
  //     apiKey: "AIzaSyCMcIEVnuEpLkoLgTHEC37FNdP5UI_jw-k",
  //     appId: "1:280337506389:android:85918bc697a6d2cccc74dc",
  //     messagingSenderId: "280337506389",
  //     projectId: "remindmi-9dc14",
  //   ),
  // );

  await Firebase.initializeApp();

  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    ),
  );
}
// FirebaseApp firebaseApp = await Firebase.initializeApp(
// options: const FirebaseOptions(
// apiKey: "AIzaSyBJz4fybK5xR2r1_T1swuyUoHjwpMlBFlw",
// appId: "1:808243495408:android:14882011ffcdebbbf21d35",
// messagingSenderId: "808243495408",
// projectId: "remender-c60c3",
// ),
// );

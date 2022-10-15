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
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    ),
  );
}

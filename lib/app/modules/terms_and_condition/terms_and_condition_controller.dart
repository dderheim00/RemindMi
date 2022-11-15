import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:remindmi/app/routes/app_pages.dart';

class SplashController extends GetxController {
  final getStorge = GetStorage();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    if (getStorge.read("id") != null) {
      Future.delayed(const Duration(milliseconds: 2000), () {
        // Get.offAllNamed(Routes.HOME);
        Get.offAllNamed(Routes.BOTTOMNAVIGATIION);
      });
    } else {
      Future.delayed(const Duration(milliseconds: 2000), () {
        Get.offAllNamed(Routes.LANDINGPAGE);
      });
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}

import 'package:get/get.dart';
import 'package:remindmi/app/modules/accessibility/accessibility_controller.dart';
import 'package:remindmi/app/modules/setting/setting_cntroller.dart';
import 'package:remindmi/app/modules/signup/signup_controller.dart';

class AccessibilityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccessibilityController>(
      () => AccessibilityController(),
    );
  }
}

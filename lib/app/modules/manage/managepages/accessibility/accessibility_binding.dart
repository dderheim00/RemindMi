import 'package:get/get.dart';
import 'package:remindmi/app/modules/manage/managepages/accessibility/accessibility_controller.dart';

class AccessibilityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccessibilityController>(
      () => AccessibilityController(),
    );
  }
}

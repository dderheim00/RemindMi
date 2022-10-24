import 'package:get/get.dart';
import 'package:remindmi/app/modules/parenthome/parent_home_controller.dart';
// import 'package:remindmi/app/modules/signup/signup_controller.dart';
import 'package:remindmi/app/modules/childrenhome/children_home_controller.dart';
// import 'login_controller.dart';

class ChildrenHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChildrenHomeController>(
      () => ChildrenHomeController(),
    );
  }
}

import 'package:get/get.dart';
import 'package:remindmi/app/modules/setting/setting_cntroller.dart';
import 'package:remindmi/app/modules/signup/signup_controller.dart';

// import 'login_controller.dart';

class SettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingController>(
      () => SettingController(),
    );
  }
}

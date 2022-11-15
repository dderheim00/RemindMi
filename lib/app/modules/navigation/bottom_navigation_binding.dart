import 'package:get/get.dart';
import 'package:remindmi/app/modules/navigation/bottom_navigation_page_controller.dart';



class NavigationPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavigationController>(
      () => BottomNavigationController(),
    );
  }
}

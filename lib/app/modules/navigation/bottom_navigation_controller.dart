import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class BottomNavigationController extends GetxController {
  //here selected index indicates the page to be displayed on clicking bottom navigation icons
  final getStorge = GetStorage();
  var selectedIndex = 0.obs;
  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}

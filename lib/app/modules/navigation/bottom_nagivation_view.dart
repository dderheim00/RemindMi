import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remindmi/app/modules/home/views/home_view.dart';
import 'package:remindmi/app/modules/navigation/bottom_navigation_page_controller.dart';
import 'package:remindmi/dashboard.dart';

class NavigationPage extends StatelessWidget {
  BottomNavigationController bottomNavigationBarController =
      Get.put(BottomNavigationController());

  NavigationPage({Key? key}) : super(key: key);
  final screens = [
    DashboardPage(),
    HomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: 0,
          children: screens,
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white38,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          onTap: (index) {
            bottomNavigationBarController.changeIndex(index);
          },
          currentIndex: bottomNavigationBarController.selectedIndex.value,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Dashboard',
              backgroundColor: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}

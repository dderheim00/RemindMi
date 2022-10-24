import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:remindmi/accessibility.dart';
import 'package:remindmi/app/modules/parenthome/parent_home_view.dart';
import 'package:remindmi/app/routes/app_pages.dart';
import 'package:remindmi/credits.dart';
import 'package:remindmi/dashboard.dart';
import 'package:remindmi/my_drawer_header.dart';
import 'package:remindmi/privacy_policy.dart';
import 'package:remindmi/settings.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
    // return Scaffold(
    //     appBar: AppBar(
    //       title: const Text('HomeView'),
    //       centerTitle: true,
    //     ),
    //     body: Center(
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           Text(
    //             controller.name,
    //             style: const TextStyle(fontSize: 20),
    //           ),
    //           ElevatedButton(
    //             child: const Text("Logout"),
    //             onPressed: () {
    //               controller.logout();
    //             },
    //           )
    //         ],
    //       ),
    //     ));
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentPage = DrawerSections.dashboard;

  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.dashboard) {
      container = DashboardPage();
    } else if (currentPage == DrawerSections.accessibility) {
      container = AccessibilityPage();
    } else if (currentPage == DrawerSections.settings) {
      container = SettingsPage();
    } else if (currentPage == DrawerSections.credits) {
      container = CreditsPage();
    } else if (currentPage == DrawerSections.privacy_policy) {
      container = PrivacyPolicyPage();
    } else if (currentPage == DrawerSections.parent_page) {
      container = ParentHomeView();
    }

    final getStorge = GetStorage();
    final role = getStorge.read("role");

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green[700],
        title: Text("RemindMi"),
      ),
      body: container,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                MyHeaderDrawer(),
                ParentDrawerList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget ParentDrawerList() {
    final getStorge = GetStorage();
    final role = getStorge.read("role");
    return Container(
      padding: EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        // shows the list of menu drawer
        children: [
          if (role == 'parent') ...[
            menuItem(6, "Add Dependent", Icons.dashboard_outlined,
                currentPage == DrawerSections.dashboard ? true : false),
          ],
          menuItem(1, "Tasks", Icons.dashboard_outlined,
              currentPage == DrawerSections.dashboard ? true : false),
          menuItem(2, "Accessibility", Icons.event,
              currentPage == DrawerSections.accessibility ? true : false),
          menuItem(3, "Settings", Icons.settings_outlined,
              currentPage == DrawerSections.settings ? true : false),
          Divider(),
          menuItem(4, "Credits", Icons.notifications_outlined,
              currentPage == DrawerSections.credits ? true : false),
          menuItem(5, "Privacy policy", Icons.privacy_tip_outlined,
              currentPage == DrawerSections.privacy_policy ? true : false),
          menuItem(7, "Log Out", Icons.privacy_tip_outlined, false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    final getStorge = GetStorage();
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          if (id == 7) {
            getStorge.erase();
            Get.offAllNamed(Routes.LOGIN);
          }
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.dashboard;
            } else if (id == 2) {
              currentPage = DrawerSections.accessibility;
            } else if (id == 3) {
              currentPage = DrawerSections.settings;
            } else if (id == 4) {
              currentPage = DrawerSections.credits;
            } else if (id == 5) {
              currentPage = DrawerSections.privacy_policy;
            } else if (id == 6) {
              currentPage = DrawerSections.parent_page;
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  dashboard,
  contacts,
  accessibility,
  notes,
  settings,
  credits,
  privacy_policy,
  send_feedback,
  parent_page,
}

import 'package:get/get.dart';
import 'package:remindmi/app/modules/manage/managepages/accessibility/accessibility_binding.dart';
import 'package:remindmi/app/modules/manage/managepages/accessibility/accessibility_view.dart';
import 'package:remindmi/app/modules/addDependent/add_dependent_binding.dart';
import 'package:remindmi/app/modules/addDependent/add_dependent_view.dart';
import 'package:remindmi/app/modules/addtask/add_task_binding.dart';
import 'package:remindmi/app/modules/addtask/add_task_view.dart';
import 'package:remindmi/app/modules/all_task_list/all_task_list_binding.dart';
import 'package:remindmi/app/modules/all_task_list/all_task_list_view.dart';

import 'package:remindmi/app/modules/dependent_home_task/dependent_home_task_binding.dart';
import 'package:remindmi/app/modules/dependent_home_task/dependent_home_task_view.dart';
import 'package:remindmi/app/modules/edit_task/edit_task_binding.dart';
import 'package:remindmi/app/modules/edit_task/edit_task_view.dart';
import 'package:remindmi/app/modules/forgotpassword/forgotpassword_binding.dart';
import 'package:remindmi/app/modules/forgotpassword/forgotpassword_view.dart';
import 'package:remindmi/app/modules/landing_page/landingPage_binding.dart';
import 'package:remindmi/app/modules/landing_page/landingPage_view.dart';
import 'package:remindmi/app/modules/login/login_binding.dart';
import 'package:remindmi/app/modules/login/login_view.dart';
import 'package:remindmi/app/modules/manage/manage_binding.dart';
import 'package:remindmi/app/modules/manage/manage_view.dart';
import 'package:remindmi/app/modules/navigation/bottom_nagivation_view.dart';
import 'package:remindmi/app/modules/navigation/bottom_navigation_binding.dart';
import 'package:remindmi/app/modules/setting/setting_binding.dart';
import 'package:remindmi/app/modules/setting/setting_view.dart';

import 'package:remindmi/app/modules/signup/signup_view.dart';
import 'package:remindmi/app/modules/signup/signup_binding.dart';
import 'package:remindmi/app/modules/splash/splash_binding.dart';
import 'package:remindmi/app/modules/splash/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => const SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.LANDINGPAGE,
      page: () => const LandingPage_view(),
      binding: LandingPageBinding(),
    ),
    GetPage(
      name: _Paths.FORGOTPASSWORD,
      page: () => const ForgotPassword_view(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOMNAVIGATIION,
      page: () => BottomNavigationView(),
      binding: BottomNavigationBinding(),
    ),
    GetPage(
      name: _Paths.ADDTASK,
      page: () => AddTaskView(),
      binding: AddTaskBinding(),
    ),
    GetPage(
      name: _Paths.MANAGE,
      page: () => ManageView(),
      binding: ManageBinding(),
    ),
    GetPage(
      name: _Paths.ADDDEPENDENT,
      page: () => AddDependentView(),
      binding: AddDependentBinding(),
    ),
    GetPage(
      name: _Paths.EDITTASK,
      page: () => EditTaskView(row: null),
      binding: EditTaskBinding(),
    ),
    GetPage(
      name: _Paths.DEPENDENTHOMETASKLIST,
      page: () => DependentHomeTaskListViews(),
      binding: DependentHomeTaskListBinding(),
    ),
    GetPage(
      name: _Paths.ALLTASK,
      page: () => AllTaskListView(),
      binding: AllTaskListBinding(),
    ),
    GetPage(
      name: _Paths.SETTING,
      page: () => SettingView(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: _Paths.SETTING,
      page: () => AccessibilityView(),
      binding: AccessibilityBinding(),
    ),
  ];
}

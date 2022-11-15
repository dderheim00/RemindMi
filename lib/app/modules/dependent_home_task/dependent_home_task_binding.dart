import 'package:get/get.dart';
import 'package:remindmi/app/modules/dependent_home_task/dependent_home_task_controller.dart';
import 'package:remindmi/app/modules/home_task_list_page/home_task_list_controller.dart';

class DependentHomeTaskListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DependentHomeTaskListController>(
      () => DependentHomeTaskListController(),
    );
  }
}

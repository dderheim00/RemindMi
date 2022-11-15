import 'package:get/get.dart';
import 'package:remindmi/app/modules/addtask/add_task_controller.dart';
import 'package:remindmi/app/modules/all_task_list/all_task_list_controller.dart';
import 'package:remindmi/app/modules/home_task_list_page/home_task_list_controller.dart';

class AllTaskListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllTaskListController>(
      () => AllTaskListController(),
    );
  }
}

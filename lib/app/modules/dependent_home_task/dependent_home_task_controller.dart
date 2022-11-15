import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:remindmi/app/models/home_task_list_model.dart';

import 'package:remindmi/app/services/firestore_db.dart';

class DependentHomeTaskListController extends GetxController {
  final getStorge = GetStorage();
  final tasks = <Task>[].obs;

  @override
  void onInit() {
    // All the incompleted task of depedent is loaded on oninit function by dependentHomeGetIncompleteTasks() Method
    tasks.bindStream(FireStoreDB().dependentHomeGetIncompleteTasks());

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}

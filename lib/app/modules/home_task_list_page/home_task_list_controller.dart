import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:remindmi/app/models/home_task_list_model.dart';

import 'package:remindmi/app/services/firestore_db.dart';

class HomeTaskListController extends GetxController {
  final getStorge = GetStorage();
  final tasks = <Task>[].obs;

  @override
  void onInit() {
    //here the task list is fetched and mapped from the below function
    tasks.bindStream(FireStoreDB().parentGetInCompleteTasks());

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

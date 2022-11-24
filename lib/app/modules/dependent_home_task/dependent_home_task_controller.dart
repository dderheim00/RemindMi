import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:remindmi/app/models/home_task_list_model.dart';
import 'package:remindmi/app/services/firestore_db.dart';

class DependentHomeTaskListController extends GetxController {
  final getStorge = GetStorage();
  final tasks = <Task>[].obs;

  @override
  void onInit() {
    // All the uncompleted task of dependent is loaded on onInit() function by dependentHomeGetIncompleteTasks() method
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

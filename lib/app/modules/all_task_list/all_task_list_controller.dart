import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:remindmi/app/models/home_task_list_model.dart';
import 'package:remindmi/app/services/firestore_db.dart';

class AllTaskListController extends GetxController {
  final getStorge = GetStorage();
  final tasks = <Task>[].obs;
  @override
  void onInit() {
    super.onInit();
    //all the completed and incompleted tadks are fetched by getAllTasks
    tasks.bindStream(FireStoreDB().getAllTasks());
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

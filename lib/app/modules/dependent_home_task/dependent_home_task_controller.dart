import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:remindmi/app/models/home_task_list_model.dart';

import 'package:remindmi/app/services/firestore_db.dart';

class DependentHomeTaskListController extends GetxController {
  final getStorge = GetStorage();
  final tasks = <Task>[].obs;

  @override
  void onInit() {
    tasks.bindStream(FireStoreDB().dependentHomeGetIncompleteTasks());
    print(
        ")))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))");
    print(tasks.length);
    super.onInit();
  }

  @override
  void onReady() {
    print(
        ")))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))");
    print(tasks.length);
    super.onReady();
  }

  @override
  void onClose() {
    print(
        ")))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))");
    print(tasks.length);
    super.onClose();
  }
}

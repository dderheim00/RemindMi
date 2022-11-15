import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_storage/get_storage.dart';
import 'package:remindmi/app/models/add_task_dependent_list_model.dart';
import 'package:remindmi/app/models/home_task_list_model.dart';

class FireStoreDB {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final getStorge = GetStorage();

  Stream<List<Task>> getAllTasks() {
    //all incomplete and completed tasks are fetched from firebase to parent all task page
    //tasks are in collection named as 'tasks' in firebase
    if (getStorge.read('role') == 'dependent') {
      var test = _firebaseFirestore
          .collection('tasks')
          .orderBy('priority')
          .snapshots()
          .map((snapshot) {
        return snapshot.docs
            .map((doc) => (Task.fromSnapshot(doc)))
            .where((element) => element.dependentList
                .any((element) => element.dep == getStorge.read('id')))
            .toList();
      });
      return test;
    } else {
      var test = _firebaseFirestore
          .collection('tasks')
          .where('parent', isEqualTo: getStorge.read("id"))
          .orderBy('priority')
          .snapshots()
          .map((snapshot) {
        return snapshot.docs.map((doc) => Task.fromSnapshot(doc)).toList();
      });
      return test;
    }
  }

  Stream<List<Task>> parentGetInCompleteTasks() {
    //only the incompleted tasks are fetched from firebase to parent home screen page
    //where there are task list
    var test = _firebaseFirestore
        .collection('tasks')
        .where('parent', isEqualTo: getStorge.read("id"))
        .orderBy('priority')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => (Task.fromSnapshot(doc)))
          .where((element) =>
              element.dependentList.any((element) => element.status == false))
          .toList();
    });

    return test;
  }

  Stream<List<Dependent>> getAllDependentAddTask() {
    // In add task page there lies list of dependent which is fetched by this function
    // Here names of depedendent are stored in collection 'user' where they are filtered by their role
    var test = _firebaseFirestore
        .collection('users')
        .where('parent', isEqualTo: getStorge.read("id"))
        .where('role', isEqualTo: 'dependent')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Dependent.fromSnapshot(doc)).toList();
    });

    return test;
  }

  Stream<List<Task>> dependentHomeGetIncompleteTasks() {
    // Here the task list of depedndent on their respective home screen are fetched from collection 'tasks'
    var test = _firebaseFirestore
        .collection('tasks')
        .orderBy('priority')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => (Task.fromSnapshot(doc)))
          .where((element) => element.dependentList.any((element) {
                if (element.dep == getStorge.read('id') &&
                    element.status == false) {
                  return true;
                } else {
                  return false;
                }
              }))
          .toList();
    });

    return test;
  }
}

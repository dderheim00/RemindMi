import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  final String name;
  final String description;
  final String date;
  final String time;
  final int priority;
  final String parentName;
  final String id;
  final String parent;

  final List depenListString;
  int dependent = 0;
  final List<DependentList> dependentList;

  Task({
    required this.name,
    required this.description,
    required this.date,
    required this.time,
    required this.dependent,
    required this.priority,
    required this.dependentList,
    required this.parentName,
    required this.parent,
    required this.depenListString,
    required this.id,
  });

  static Task fromSnapshot(DocumentSnapshot snap) {
    if (snap.data().toString().contains('dependent')) {}

    List<dynamic> depList = snap['dependent'];

    Task task = Task(
      //Modal of task is created here which contains all the information related to taska
      id: snap.reference.id,
      name: snap['name'],
      description: snap['description'],
      time: snap['time'],
      priority: snap['priority'],
      parentName: snap['parentName'],
      parent: snap['parent'],
      dependent: (snap.data().toString().contains('dependent')
          ? snap['dependent'].length
          : 0),
      date: snap['date'],
      dependentList:
          depList.map((doc) => DependentList.fromdepListModal(doc)).toList(),
      depenListString: depList,
    );
    return task;
  }
}

class DependentList {
  final String dep;
  final String depName;
  final bool status;

  DependentList({
    required this.dep,
    required this.depName,
    required this.status,
  });

  static DependentList fromdepListModal(var snap) {
    DependentList dependentList = DependentList(
      // modal of dependent list is created here which contains the details of dependent
      dep: snap['dep'],
      depName: snap['depName'],
      status: snap['status'],
    );
    return dependentList;
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

dynamic priorityBorder(int priority) {
  if (priority == 1) {
    return Colors.red;
  } else if (priority == 2) {
    return Color.fromARGB(255, 184, 166, 3);
  } else {
    return Colors.green;
  }
}

dynamic priorityTitile(int priority) {
  if (priority == 1) {
    return Colors.red;
  } else if (priority == 2) {
    return Color.fromARGB(255, 184, 166, 3);
  } else {
    return Colors.green;
  }
}

dynamic prioritySubTitle(int priority) {
  if (priority == 1) {
    return Color.fromARGB(255, 247, 109, 100);
  } else if (priority == 2) {
    return Color.fromARGB(255, 184, 166, 3);
  } else {
    return Colors.green;
  }
}

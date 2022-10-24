import 'package:flutter/material.dart';
import 'package:remindmi/app/components/task_list_card.dart';
import 'package:remindmi/app/models/home_task_list_model.dart';

class DashboardPage extends StatelessWidget {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: Settings',
      style: optionStyle,
    ),
  ];

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
            itemCount: Task.tasks.length,
            itemBuilder: (BuildContext context, int index) {
              return TaskListCard(index: index);
            }),
      ),
    );
  }
}

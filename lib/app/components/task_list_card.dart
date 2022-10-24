import 'package:flutter/material.dart';
import 'package:remindmi/app/models/home_task_list_model.dart';

class TaskListCard extends StatefulWidget {
  final int index;

  const TaskListCard({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<TaskListCard> createState() => _TaskListCardState();
}

class _TaskListCardState extends State<TaskListCard> {
  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new Container(
        padding: new EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            new CheckboxListTile(
                activeColor: Colors.pink[300],
                dense: true,
                //font change
                title: new Text(
                  Task.tasks[widget.index].title,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5),
                ),
                value: Task.tasks[widget.index].isCheck,
                secondary: Container(
                  height: 50,
                  width: 50,
                  child: Image.asset(
                    Task.tasks[widget.index].img,
                    fit: BoxFit.cover,
                  ),
                ),
                onChanged: (val) {
                  setState(() {
                    Task.tasks[widget.index].isCheck = val!;
                  });
                })
          ],
        ),
      ),
    );
  }
}

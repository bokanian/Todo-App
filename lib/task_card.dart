import 'package:flutter/material.dart';
import 'package:flutter_todo_app/model/task_model.dart';
import 'package:flutter_todo_app/task_tile.dart';

class TaskTile extends StatefulWidget {
  @override
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  static bool isChecked = false;

  static List<TaskModel> tasks = [
    TaskModel(
      id: 1,
      title: 'task number one',
      date: DateTime.now().toString(),
      isCheck: isChecked,
    ),
  ];

  void checkboxCallback(bool checkBoxValue) {
    setState(() {
      isChecked = checkBoxValue;
      print(checkBoxValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: tasks
            .map((e) => Card(
                  child: TaskTileWidget(
                    id: e.id.toString(),
                    title: e.title,
                    date: e.date,
                    checkBoxValue: isChecked,
                    checkboxController: checkboxCallback,
                  ),
                  color: isChecked ? Colors.grey : Colors.green.shade300,
                ))
            .toList());
  }
}

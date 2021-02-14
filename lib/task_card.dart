import 'package:flutter/material.dart';
import 'package:flutter_todo_app/task_tile.dart';

class TaskTile extends StatefulWidget {
  @override
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  static bool isChecked = false;
  void checkboxCallback(bool checkBoxValue) {
    setState(() {
      isChecked = checkBoxValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        color: isChecked ? Colors.grey : Colors.green.shade300,
        child: TaskTileWidget(
          checkBoxValue: isChecked,
          checkboxController: checkboxCallback,
        ));
  }
}

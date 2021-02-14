import 'package:flutter/material.dart';
import 'package:flutter_todo_app/task_card.dart';

class TasksList extends StatefulWidget {
  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return TaskTile();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_todo_app/model/task_model.dart';
import 'package:flutter_todo_app/task_tile_widget.dart';

class TaskCard extends StatefulWidget {
  final List<TaskModel> tasks;
  final Function checkboxController;

  TaskCard({
    @required this.tasks,
    @required this.checkboxController,
  });

  @override
  _TaskCardState createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
    return ListView(
        children: widget.tasks
            .map((e) => Card(
                  child: TaskTileWidget(
                    id: e.id.toString(),
                    title: e.title,
                    date: e.date,
                  ),
                  color: e.isCheck ? Colors.grey : Colors.green.shade300,
                ))
            .toList());
  }
}

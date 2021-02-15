import 'package:flutter/material.dart';
import 'package:flutter_todo_app/model/task_model.dart';
import 'package:flutter_todo_app/task_tile_widget.dart';

class TaskCard extends StatelessWidget {
  final bool checkboxCard;
  final List<TaskModel> tasks;
  final Function checkboxController;

  TaskCard({
    @required this.tasks,
    @required this.checkboxCard,
    @required this.checkboxController,
  });
  @override
  Widget build(BuildContext context) {
    return ListView(
        children: tasks
            .map((e) => Card(
                  child: TaskTileWidget(
                    id: e.id.toString(),
                    title: e.title,
                    date: e.date,
                    checkBoxValue: e.isCheck,
                    checkboxController: checkboxController,
                  ),
                  color: checkboxCard ? Colors.grey : Colors.green.shade300,
                ))
            .toList());
  }
}

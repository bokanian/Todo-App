import 'package:flutter/material.dart';
import 'package:flutter_todo_app/model/task_data.dart';
import 'package:flutter_todo_app/task_tile_widget.dart';
import 'package:provider/provider.dart';

class TaskCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TasksData>(
      builder: (context, tasksData, child) {
        return ListView(
            children: tasksData.tasks
                .map((e) => Card(
                      child: TaskTileWidget(
                        id: e.id.toString(),
                        title: e.title,
                        date: e.date,
                      ),
                      color: Colors.blue.shade300,
                    ))
                .toList());
      },
    );
  }
}

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
            children: tasksData.tasks.map((e) {
          var index = tasksData.tasks.indexOf(e);
          return Card(
            child: TaskTileWidget(
              id: e.id.toString(),
              title: e.title,
              date: e.date,
              isChecked: e.isCheck,
              checkboxCallback: (checkboxStatus) {
                tasksData.updateTask(tasksData.tasks[index]);
              },
              longPress: () {
                tasksData.removeTask(tasksData.tasks[index]);
              },
            ),
            color: e.isCheck ? Colors.grey.shade400 : Colors.green.shade300,
          );
        }).toList());

        //TODO could be list view as well
        // return ListView.builder(
        //   itemBuilder: (context, index) {
        //     final task = tasksData.tasks[index];
        //     return Card(
        //       child: TaskTileWidget(
        //         id: task.id.toString(),
        //         title: task.title,
        //         date: task.date,
        //         isChecked: task.isCheck,
        //         checkboxCallback: (checkboxStatus) {
        //           tasksData.updateTask(task);
        //         },
        //       ),
        //     );
        //   },
        // );
      },
    );
  }
}

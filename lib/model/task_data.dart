import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter_todo_app/model/task_model.dart';

class TasksData extends ChangeNotifier {
  List<TaskModel> _tasks = [
    TaskModel(
      id: 1,
      title: 'task number one',
      date: DateTime.now().toString(),
    ),
    TaskModel(
      id: 2,
      title: 'task number one',
      date: DateTime.now().toString(),
    ),
    TaskModel(
      id: 3,
      title: 'task number one',
      date: DateTime.now().toString(),
    ),
  ];

  UnmodifiableListView<TaskModel> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get tasksCount {
    return _tasks.length;
  }

//  instead: Provider.of<TasksData>(context).tasks.length
  void addTask(String newTaskTitle) {
    final task = TaskModel(
      id: tasksCount + 1,
      title: newTaskTitle,
      date: DateTime.now().toString(),
    );
    _tasks.add(task);
    notifyListeners();
  }
}

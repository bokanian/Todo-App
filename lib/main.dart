import 'package:flutter/material.dart';
import 'package:flutter_todo_app/home_screen.dart';
import 'package:flutter_todo_app/model/task_data.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TasksData(),
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}

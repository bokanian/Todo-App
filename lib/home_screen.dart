import 'package:flutter/material.dart';
import 'package:flutter_todo_app/model/task_data.dart';
import 'package:flutter_todo_app/model/task_model.dart';
import 'package:flutter_todo_app/task_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static String inputText;

  //Bottom Sheet
  final TextEditingController _textController = TextEditingController();
  void displayBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return Container(
          color: Color(0xff757575),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
            ),
            height: MediaQuery.of(context).size.height * 0.6,
            child: Container(
              padding: EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('Add Task'),
                  TextField(
                    onChanged: (newText) {
                      inputText = newText;
                    },
                    controller: _textController,
                    decoration: InputDecoration(
                      labelText: 'new task',
                      suffixIcon: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          _textController.clear();
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      //TODO add new task below method work same
                      // final task = TaskModel(
                      //   id: Provider.of<TasksData>(context, listen: false)
                      //           .tasksCount +
                      //       1,
                      //   title: inputText,
                      //   date: DateTime.now().toString(),
                      // );
                      // Provider.of<TasksData>(context, listen: false)
                      //     .tasks
                      //     .add(task);
                      Provider.of<TasksData>(context, listen: false)
                          .addTask(inputText);

                      Navigator.pop(context);
                      _textController.clear();
                    },
                    child: Text('Add'),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(left: 40, top: 45),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.list,
                      color: Colors.blue,
                      size: 40,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Todo App',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '${Provider.of<TasksData>(context).tasksCount} Tasks',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                margin: EdgeInsets.only(top: 30),
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: TaskCard(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => displayBottomSheet(context),
        child: Icon(
          Icons.add,
          size: 40,
        ),
      ),
    );
  }
}

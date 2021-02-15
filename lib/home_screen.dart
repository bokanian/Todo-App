import 'package:flutter/material.dart';
import 'package:flutter_todo_app/model/task_model.dart';
import 'package:flutter_todo_app/task_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static String inputText;

  static List<TaskModel> tasks = [
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
                      tasks.add(
                        TaskModel(
                            id: tasks.length + 1,
                            title: inputText,
                            date: DateTime.now().toString()),
                      );
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
                    tasks.length.toString(),
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
                child: TaskCard(tasks: tasks),
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

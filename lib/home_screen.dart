import 'package:flutter/material.dart';
import 'package:flutter_todo_app/task_tile.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //bottom sheet text field controller
  TextEditingController _textController = TextEditingController();

  //handel the check box
  bool checkBoxValue = false;

  //bottom sheet
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
                      controller: _textController,
                      decoration: InputDecoration(
                        labelText: 'new task',
                        suffixIcon: IconButton(
                          icon: Icon(Icons.clear),
                          onPressed: () => _textController.clear(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        print(_textController.text);
                        _textController.clear();
                      },
                      child: Text('Add'),
                    )
                  ],
                ),
              ),
            ),
          );
        });
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
                    '12 tasks',
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
                child: ListView(
                  children: [
                    TaskTile(
                      checkBoxValue: checkBoxValue,
                      checkBoxController: (newValue) {
                        setState(() {
                          checkBoxValue = newValue;
                          print(checkBoxValue);
                        });
                      },
                    ),
                    TaskTile(
                      checkBoxValue: checkBoxValue,
                      checkBoxController: (newValue) {
                        setState(() {
                          checkBoxValue = newValue;
                          print(checkBoxValue);
                        });
                      },
                    ),
                    TaskTile(
                      checkBoxValue: checkBoxValue,
                      checkBoxController: (newValue) {
                        setState(() {
                          checkBoxValue = newValue;
                          print(checkBoxValue);
                        });
                      },
                    ),
                    TaskTile(
                      checkBoxValue: checkBoxValue,
                      checkBoxController: (newValue) {
                        setState(() {
                          checkBoxValue = newValue;
                          print(checkBoxValue);
                        });
                      },
                    ),
                  ],
                ),
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

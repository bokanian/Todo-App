import 'package:flutter/material.dart';

class TaskTileWidget extends StatefulWidget {
  @override
  _TaskTileWidgetState createState() => _TaskTileWidgetState();
}

class _TaskTileWidgetState extends State<TaskTileWidget> {
  bool checkBoxValue = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        margin: EdgeInsets.only(top: 11),
        child: Text(
          '10',
          style: TextStyle(
            fontSize: 15,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      title: Text('title text'),
      subtitle: Text('${DateTime.now()}'),
      trailing: Checkbox(
        value: checkBoxValue,
        onChanged: (newValue) {
          setState(() {
            checkBoxValue = newValue;
            print(checkBoxValue);
          });
        },
      ),
    );
  }
}

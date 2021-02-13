import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final Function checkBoxController;
  final bool checkBoxValue;

  TaskTile({@required this.checkBoxController, @required this.checkBoxValue});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
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
          onChanged: checkBoxController,
        ),
      ),
    );
  }
}

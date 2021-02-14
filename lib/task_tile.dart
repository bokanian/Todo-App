import 'package:flutter/material.dart';

class TaskTileWidget extends StatelessWidget {
  final bool checkBoxValue;
  final Function checkboxController;
  final String id;
  final String title;
  final String date;

  TaskTileWidget({
    @required this.checkBoxValue,
    @required this.checkboxController,
    @required this.id,
    @required this.title,
    @required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        margin: EdgeInsets.only(top: 11),
        child: Text(
          id,
          style: TextStyle(
            fontSize: 15,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
            decoration: checkBoxValue ? TextDecoration.lineThrough : null),
      ),
      subtitle: Text(date),
      trailing: Checkbox(
        value: checkBoxValue,
        onChanged: checkboxController,
      ),
    );
  }
}

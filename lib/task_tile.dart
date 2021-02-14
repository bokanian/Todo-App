import 'package:flutter/material.dart';

class TaskTileWidget extends StatelessWidget {
  final bool checkBoxValue;
  final Function checkboxController;

  TaskTileWidget(
      {@required this.checkBoxValue, @required this.checkboxController});

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
      title: Text(
        'title text',
        style: TextStyle(
            decoration: checkBoxValue ? TextDecoration.lineThrough : null),
      ),
      subtitle: Text('${DateTime.now()}'),
      trailing: Checkbox(
        value: checkBoxValue,
        onChanged: checkboxController,
      ),
    );
  }
}

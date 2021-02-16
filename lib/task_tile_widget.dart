import 'package:flutter/material.dart';

class TaskTileWidget extends StatelessWidget {
  final String id;
  final String title;
  final String date;
  final bool isChecked;
  final Function checkboxCallback;
  final Function longPress;

  TaskTileWidget({
    @required this.id,
    @required this.title,
    @required this.date,
    @required this.isChecked,
    @required this.checkboxCallback,
    @required this.longPress,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPress,
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
            color: isChecked ? Colors.red.shade700 : null,
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      subtitle: Text(date),
      trailing: Checkbox(
        value: isChecked,
        onChanged: checkboxCallback,
        activeColor: Colors.red.shade400,
      ),
    );
  }
}

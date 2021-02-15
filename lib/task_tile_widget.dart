import 'package:flutter/material.dart';

class TaskTileWidget extends StatefulWidget {
  final String id;
  final String title;
  final String date;

  TaskTileWidget({
    @required this.id,
    @required this.title,
    @required this.date,
  });

  @override
  _TaskTileWidgetState createState() => _TaskTileWidgetState();
}

class _TaskTileWidgetState extends State<TaskTileWidget> {
  bool isChecked = false;
  Function toggleCheckboxState;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        margin: EdgeInsets.only(top: 11),
        child: Text(
          widget.id,
          style: TextStyle(
            fontSize: 15,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      title: Text(
        widget.title,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      subtitle: Text(widget.date),
      trailing: CheckboxWidget(
          checkboxState: isChecked,
          toggleCheckboxState: (bool checkboxState) {
            setState(() {
              isChecked = checkboxState;
              print(isChecked);
            });
          }),
    );
  }
}

class CheckboxWidget extends StatelessWidget {
  final bool checkboxState;
  final Function toggleCheckboxState;
  CheckboxWidget({this.checkboxState, this.toggleCheckboxState});

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: checkboxState,
      onChanged: toggleCheckboxState,
    );
  }
}

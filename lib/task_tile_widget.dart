import 'package:flutter/material.dart';

class TaskTileWidget extends StatefulWidget {
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
  _TaskTileWidgetState createState() => _TaskTileWidgetState();
}

class _TaskTileWidgetState extends State<TaskTileWidget> {
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
            decoration:
                widget.checkBoxValue ? TextDecoration.lineThrough : null),
      ),
      subtitle: Text(widget.date),
      trailing: CheckBoxWidget(
          checkboxState: widget.checkBoxValue,
          checkboxController: widget.checkboxController),
    );
  }
}

class CheckBoxWidget extends StatelessWidget {
  final bool checkboxState;
  final Function checkboxController;
  CheckBoxWidget(
      {@required this.checkboxState, @required this.checkboxController});

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: checkboxState,
      onChanged: checkboxController,
    );
  }
}

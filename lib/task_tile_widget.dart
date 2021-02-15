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
  void checkboxCallback(bool checkboxState) {
    setState(() {
      isChecked = checkboxState;
      print(isChecked);
      print(widget.id);
    });
  }

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
            color: isChecked ? Colors.red : null,
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      subtitle: Text(widget.date),
      trailing: CheckboxWidget(
        checkboxState: isChecked,
        checkboxOnchange: checkboxCallback,
      ),
    );
  }
}

class CheckboxWidget extends StatelessWidget {
  final bool checkboxState;
  final Function checkboxOnchange;
  CheckboxWidget({this.checkboxState, this.checkboxOnchange});

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: checkboxState,
      onChanged: checkboxOnchange,
      activeColor: Colors.redAccent,
    );
  }
}

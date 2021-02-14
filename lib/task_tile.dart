import 'package:flutter/material.dart';

class TaskTileWidget extends StatefulWidget {
  @override
  _TaskTileWidgetState createState() => _TaskTileWidgetState();
}

class _TaskTileWidgetState extends State<TaskTileWidget> {
  static bool isChecked = false;

  void checkboxCallback(bool checkBoxValue) {
    setState(() {
      isChecked = checkBoxValue;
    });
  }

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
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      subtitle: Text('${DateTime.now()}'),
      trailing: CheckBox(
        checkBoxValue: isChecked,
        checkBoxToggle: checkboxCallback,
      ),
    );
  }
}

//check box
class CheckBox extends StatelessWidget {
  final bool checkBoxValue;
  final Function checkBoxToggle;

  CheckBox({@required this.checkBoxValue, @required this.checkBoxToggle});

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: checkBoxValue,
      onChanged: checkBoxToggle,
    );
  }
}

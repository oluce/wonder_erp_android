import 'package:flutter/material.dart';

class TaskListPage extends StatefulWidget {
  TaskListPage({Key key}) : super(key: key);
  @override
  _TaskListPageState createState() => new _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Công việc'),
      ),
    );
  }
}


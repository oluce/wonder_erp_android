import 'package:flutter/material.dart';

class ProjectListPage extends StatefulWidget {
  ProjectListPage({Key key}) : super(key: key);
  @override
  _ProjectListPageState createState() => new _ProjectListPageState();
}

class _ProjectListPageState extends State<ProjectListPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Dự án'),
      ),
    );
  }
}

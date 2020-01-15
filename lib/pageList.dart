import 'package:flutter/material.dart';

class PageList extends StatefulWidget {
  PageList({Key key}) : super(key: key);
  @override
  _PageListState createState() => new _PageListState();
}

class _PageListState extends State<PageList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Trang thông tin'),
      ),
    );
  }
}

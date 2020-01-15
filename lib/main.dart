import 'package:flutter/material.dart';
import 'theme.dart';
import 'home.dart';
import 'taskList.dart';
import 'projectList.dart';
import 'pageList.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Generated App',
      theme: myTheme,
      home: MainLayout(),
    );
  }
}

class MainLayout extends StatefulWidget {
  MainLayout({Key key}) : super(key: key);
  @override
  _MainLayoutState createState() => new _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _currentIndex = 0;
  List _listPages = List();
  List _listPagesTitle = List();
  Widget _currentPage;
  Text _currentPageTitle = null;

  @override
  void initState() {
    super.initState();
    _listPagesTitle
      ..add(Text('Trang chủ'))
      ..add(Text('Dự án'))
      ..add(Text('Công việc'))
      ..add(Text('Thông tin'));
    _listPages
      ..add(HomePage())
      ..add(ProjectListPage())
      ..add(TaskListPage())
      ..add(PageList());
    _currentPage = HomePage();

  }

  void _changePage(int selectedIndex) {
    setState(() {
      _currentIndex = selectedIndex;
      _currentPage = _listPages[selectedIndex];
      _currentPageTitle =_listPagesTitle[selectedIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: _currentPageTitle,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: _currentPage,
        ),
      ),
      drawer: new Drawer(
          child: new ListView(
        children: <Widget>[
          new DrawerHeader(
            child: new Text("wonder.vn"),
            decoration: new BoxDecoration(color: Colors.blueGrey),
          ),
          new ListTile(
            title: new Text("Nội quy công ty"),
            onTap: () {
              setState(() {
                _currentIndex = 3;
                _currentPage = PageList();
                _currentPageTitle = Text("DỰ ÁN");
              });
              Navigator.of(context).pop();
            },
          ),
          new ListTile(
            title: new Text("Quy định KPI"),
            onTap: () {
              setState(() {
                _currentIndex = 3;
                _currentPage = PageList();
                _currentPageTitle = Text("DỰ ÁN 2");
              });
              Navigator.of(context).pop();
            },
          )],
          ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            title: Text('Dự án'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.playlist_play),
            title: Text('Công việc'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.streetview),
            title: Text('Thông tin'),
          ),
        ],
        onTap: (selectedIndex) => _changePage(selectedIndex),
      ),
    );
  }
}

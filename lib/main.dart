import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Generated App',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xFF2196f3),
        accentColor: const Color(0xFF2196f3),
        canvasColor: const Color(0xFFfafafa),
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Bảng tin'),
      ),
      body: Center(
        child: RaisedButton(
            child: Text('Mở MySecondRoute'),
            // Within the `FirstRoute` widget
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MySecondRoute()),
              );
            }),
      ),
      drawer: new DrawerOnly(),
      bottomNavigationBar: new BottomNavigationBarOnly(),
    );
  }
}

class BottomNavigationBarOnly extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new BottomNavigationBar(items: [
      new BottomNavigationBarItem(
        icon: const Icon(Icons.home),
        title: new Text('Bảng tin'),
      ),
      new BottomNavigationBarItem(
        icon: const Icon(Icons.list),
        title: new Text('Dự án'),
      ),
      new BottomNavigationBarItem(
        icon: const Icon(Icons.playlist_play),
        title: new Text('Công việc'),
      )
    ]);
  }
}

class DrawerOnly extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
        child: new ListView(
      children: <Widget>[
        new DrawerHeader(
          child: new Text("DRAWER HEADER.."),
          decoration: new BoxDecoration(color: Colors.orange),
        ),
        new ListTile(
          title: new Text("Item => 11"),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => new MySecondRoute()));
          },
        ),
        new ListTile(
          title: new Text("Item => 22"),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => new SecondPage()));
          },
        ),
      ],
    ));
  }
}


class MySecondRoute extends StatefulWidget {
  MySecondRoute({Key key}) : super(key: key);
  @override
  _MySecondRouteState createState() => new _MySecondRouteState();
}

class _MySecondRouteState extends State<MySecondRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Second Route"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
      drawer: new DrawerOnly(),
      bottomNavigationBar: new BottomNavigationBarOnly(),
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: new DrawerOnly(), // new Line
      appBar: new AppBar(
        title: new Text("First Page"),
      ),
      body: new Text("I belongs to First Page"),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: new DrawerOnly(), // New Line
      appBar: new AppBar(
        title: new Text("Second Page"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}

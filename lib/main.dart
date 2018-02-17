import 'package:flutter/material.dart';

void main() => runApp(new TranseeApp());

class TranseeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Transee',
      theme: new ThemeData(
          primarySwatch: Colors.blueGrey, accentColor: Colors.lightBlue),
      home: new HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Home page"),
        ),
        body: new Center(child: new Text('Hello, Transee')));
  }
}

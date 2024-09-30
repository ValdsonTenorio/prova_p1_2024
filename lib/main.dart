import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _App();
  }
}

class _App extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        child: Text("Olá"),
      ),
    );
  }
}

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
  int valor = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Text("Contando $valor"),
        floatingActionButton: FloatingActionButton(onPressed: () {
          setState(() {
            valor++;
          });
        }),
      ),
    );
  }
}

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
      home: Scaffold(
        body: ListView(
          children: [Text('1'), Text('2')],
        ),
        floatingActionButton: FloatingActionButton.large(
            foregroundColor: Colors.amber,
            backgroundColor: Colors.black,
            child: const Icon(Icons.add),
            onPressed: () {
              setState(() {});
            }),
      ),
    );
  }
}

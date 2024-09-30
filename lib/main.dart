import 'package:flutter/material.dart';
import 'package:novo_projeto/listagem.dart';

void main(List<String> args) {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<StatefulWidget> createState() {
    return _App();
  }
}

class _App extends State<App> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Listagem(),
    );
  }
}

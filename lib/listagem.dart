import 'package:flutter/material.dart';
import 'package:novo_projeto/cadastro.dart';

class Listagem extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Listagem();
  }
}

class _Listagem extends State<Listagem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [Text('1'), Text('2')],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Cadastro()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

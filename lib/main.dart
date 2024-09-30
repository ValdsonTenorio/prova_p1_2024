import 'package:flutter/material.dart';
import 'package:novo_projeto/cadastro.dart';
import 'package:novo_projeto/controle/pessoaController.dart';
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
  PessoaController pessoaController = PessoaController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: const Listagem(),
      initialRoute: '/',
      routes: {
        '/': (context) => Listagem(pessoaController: pessoaController),
        '/cadastro': (context) => Cadastro(pessoaController: pessoaController),
      },
    );
  }
}

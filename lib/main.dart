import 'package:flutter/material.dart';
import 'package:novo_projeto/cadastro.dart';
import 'package:novo_projeto/controle/pessoaController.dart';
import 'package:novo_projeto/listagem.dart';
import 'package:novo_projeto/login.dart';
import 'package:novo_projeto/autenticacao/sharedSessao.dart';

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
  final PessoaController pessoaController = PessoaController();
  final SharedSessao sharedSessao = SharedSessao();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu App',
      initialRoute: '/',
      routes: {
        '/': (context) => FutureBuilder<bool>(
          future: sharedSessao.estaLogado(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Erro: ${snapshot.error}'));
            } else {
              return snapshot.data == true
                  ? Listagem(pessoaController: pessoaController)
                  : Login(onLoginSuccess: () {
                      setState(() {}); // Atualiza a tela após o login
                    });
            }
          },
        ),
        '/listagem': (context) => Listagem(pessoaController: pessoaController),
        '/cadastro': (context) => Cadastro(pessoaController: pessoaController),
      },
    );
  }
}

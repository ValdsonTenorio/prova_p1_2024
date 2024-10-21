import 'package:flutter/material.dart';
import 'package:novo_projeto/autenticacao/sharedSessao.dart';

class Login extends StatelessWidget {
  final Function onLoginSuccess;

  const Login({super.key, required this.onLoginSuccess});

  @override
  Widget build(BuildContext context) {
    var usuarioController = TextEditingController();
    var senhaController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            decoration: const InputDecoration(hintText: "Entre com o login"),
            controller: usuarioController,
          ),
          TextField(
            obscureText: true,
            decoration: const InputDecoration(hintText: "Entre com a senha"),
            controller: senhaController,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            ElevatedButton.icon(
              onPressed: () async {
                final sharedSessao = SharedSessao();
                final loginSucesso = await sharedSessao.login(
                  usuarioController.text,
                  senhaController.text,
                );

                if (loginSucesso) {
                  onLoginSuccess(); // Notifica o sucesso do login
                } else {
                  // Mensagem de erro
                  print("Login inválido!"); // Mensagem de depuração
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Login inválido')),
                  );
                }
              },
              icon: const Icon(Icons.login),
              label: const Text('Entrar'),
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/cadastro');
              },
              icon: const Icon(Icons.add_circle_outline_sharp),
              label: const Text('Cadastrar'),
            ),
          ]),
        ],
      ),
    );
  }
}

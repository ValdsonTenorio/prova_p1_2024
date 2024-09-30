import 'package:flutter/material.dart';

class Cadastro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController nomeController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController telefoneController = TextEditingController();
    return Scaffold(
      body: Column(
        children: [
          TextField(
            decoration: const InputDecoration(hintText: 'Entre com o nome'),
            controller: nomeController,
          ),
          TextField(
            decoration: const InputDecoration(hintText: 'Entre com o email'),
            controller: emailController,
          ),
          TextField(
            decoration: const InputDecoration(hintText: 'Entre com o Telefone'),
            controller: telefoneController,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Salvar'))
        ],
      ),
    );
  }
}

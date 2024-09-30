import 'package:flutter/material.dart';
import 'package:novo_projeto/controle/pessoaController.dart';
import 'package:novo_projeto/entidade/pessoa.dart';

class Cadastro extends StatelessWidget {
  final PessoaController pessoaController;

  Cadastro(
      {required this.pessoaController}); // Recebe o controlador como argumento

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
                // Criação da nova pessoa
                Pessoa novaPessoa = Pessoa(
                  nome: nomeController.text,
                  email: emailController.text,
                  telefone: telefoneController.text,
                );

                // Adiciona a nova pessoa ao controlador
                pessoaController.salvar(novaPessoa);

                Navigator.pop(context);
              },
              child: const Text('Salvar'))
        ],
      ),
    );
  }
}

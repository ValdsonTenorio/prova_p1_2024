import 'package:flutter/material.dart';
import 'package:novo_projeto/cadastro.dart';
import 'package:novo_projeto/controle/pessoaController.dart';

class Listagem extends StatefulWidget {
  const Listagem({super.key});

  @override
  State<StatefulWidget> createState() {
    return _Listagem();
  }
}

class _Listagem extends State<Listagem> {
  PessoaController pessoaController = PessoaController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, indice) {
          return ListTile(
            title: Text(pessoaController.info(indice)),
          );
        },
        itemCount: pessoaController.size(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Cadastro(
                        pessoaController: pessoaController,
                      ))).then((_) {
            setState(() {}); // Atualiza a lista após voltar
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

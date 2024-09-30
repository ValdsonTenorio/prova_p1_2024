import 'package:flutter/material.dart';
import 'package:novo_projeto/cadastro.dart';
import 'package:novo_projeto/controle/pessoaController.dart';

class Listagem extends StatefulWidget {
  final PessoaController pessoaController;

  const Listagem(
      {super.key,
      required this.pessoaController}); // Recebe o controlador como argumento

  @override
  State<StatefulWidget> createState() {
    return _Listagem();
  }
}

class _Listagem extends State<Listagem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, indice) {
          return ListTile(
            title: Text(widget.pessoaController.info(indice)),
          );
        },
        itemCount: widget.pessoaController.size(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Cadastro(
                        pessoaController: widget.pessoaController,
                      ))).then((_) {
            setState(() {}); // Atualiza a lista após voltar
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

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
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                // Confirmação antes de excluir
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Confirmar Exclusão'),
                      content: const Text(
                          'Você tem certeza que deseja excluir este item?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Fecha o diálogo
                          },
                          child: const Text('Cancelar'),
                        ),
                        TextButton(
                          onPressed: () {
                            // Remove o item
                            widget.pessoaController
                                .remover(widget.pessoaController.get(indice));
                            setState(() {}); // Atualiza a lista após excluir
                            Navigator.of(context).pop(); // Fecha o diálogo
                          },
                          child: const Text('Excluir'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
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

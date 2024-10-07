import 'package:flutter/material.dart';
import 'package:novo_projeto/controle/pessoaController.dart';
import 'package:novo_projeto/entidade/pessoa.dart';

class Listagem extends StatefulWidget {
  final PessoaController pessoaController;

  const Listagem({super.key, required this.pessoaController});

  @override
  State<StatefulWidget> createState() {
    return _Listagem();
  }
}

class _Listagem extends State<Listagem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Listagem de Pessoas')),
      body: FutureBuilder<int>(
        future: widget.pessoaController
            .size(), // Chama o método assíncrono para obter o tamanho
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child:
                    CircularProgressIndicator()); // Indicador de carregamento
          } else if (snapshot.hasError) {
            return Center(
                child: Text('Erro: ${snapshot.error}')); // Mensagem de erro
          } else {
            // O número de itens
            final int quantidade = snapshot.data!;

            return ListView.builder(
              itemCount: quantidade,
              itemBuilder: (context, indice) {
                return GestureDetector(
                  onLongPress: () {},
                  onDoubleTap: () {},
                  child: FutureBuilder<Pessoa>(
                    future: widget.pessoaController
                        .get(indice), // Chamada assíncrona para obter a pessoa
                    builder: (context, snapshotPessoa) {
                      if (snapshotPessoa.connectionState ==
                          ConnectionState.waiting) {
                        return const ListTile(
                            title: Text(
                                'Carregando...')); // Enquanto a pessoa está sendo carregada
                      } else if (snapshotPessoa.hasError) {
                        return const ListTile(
                            title: Text('Erro ao carregar pessoa'));
                      } else {
                        final pessoa = snapshotPessoa.data!;
                        return ListTile(
                          title: Text(pessoa.nome), // Exibe o nome da pessoa
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
                                          Navigator.of(context)
                                              .pop(); // Fecha o diálogo
                                        },
                                        child: const Text('Cancelar'),
                                      ),
                                      TextButton(
                                        onPressed: () async {
                                          // Remove o item
                                          await widget.pessoaController
                                              .remover(pessoa);
                                          setState(
                                              () {}); // Atualiza a lista após excluir
                                          Navigator.of(context)
                                              .pop(); // Fecha o diálogo
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
                      }
                    },
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/cadastro').then((_) {
            setState(() {}); // Atualiza a lista após voltar
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

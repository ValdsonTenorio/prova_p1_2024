import 'package:novo_projeto/entidade/pessoa.dart';

class Dao implements InterfaceDao {
  final List<Pessoa> _dados = [];
  add(Pessoa p) {
    _dados.add(p);
  }

  remove(Pessoa p) {
    _dados.remove(p);
  }

  get dados => _dados;
}

class InterfaceDao {}

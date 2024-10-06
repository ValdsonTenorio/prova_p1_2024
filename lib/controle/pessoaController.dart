import 'package:novo_projeto/entidade/pessoa.dart';
import 'package:novo_projeto/repositorio/Dao.dart';
import 'package:novo_projeto/repositorio/interfaceDao';

class PessoaController {
  final InterfaceDao _dao = Dao();
  salvar(Pessoa p) {
    _dao.add(p);
  }

  remover(Pessoa p) {
    _dao.remove(p);
  }

  List listar() {
    return _dao.dados;
  }

  int size() {
    return _dao.dados.length;
  }

  info(int indice) {
    return _dao.dados[indice].nome;
  }

  Pessoa get(int indice) => _dao.dados[indice];
}

import 'package:novo_projeto/entidade/pessoa.dart';
import 'package:novo_projeto/repositorio/DaoSqLite.dart';
import 'package:novo_projeto/repositorio/interfaceDao';

class PessoaController {
  final InterfaceDao _dao = DaoSqLite();
  List lista = [];
  salvar(Pessoa p) {
    _dao.add(p);
  }

  remover(Pessoa p) {
    _dao.remove(p);
  }

  Future<List<Pessoa>> listar() {
    return _dao.dados;
  }

  Future<int> size() async {
    lista = await _dao.dados;
    return lista.length;
  }

  info(int indice) async {
    lista = await _dao.dados;
    return _dao.dados;
  }

  Future<Pessoa> get(int indice) async {
    lista = await _dao.dados;
    return lista[indice];
  }
}

import 'package:novo_projeto/autenticacao/secureStorage.dart';
import 'package:novo_projeto/repositorio/DaoSqLite.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

import '../entidade/usuario.dart';

class LoginController {
  final DaoSqLite _dao = DaoSqLite();
  static const secretKey = '4dm1n';
  final SecureStorage _secureStorage = SecureStorage();

  Future<int> salvar(String nome, String senha) {
    Usuario login = Usuario(nome: nome, senha: senha);
    return _dao.addUser(login);
  }

  Future<bool> login(String nome, String senha) async {
    Future<bool> retorno = _dao.login(nome, senha);
    if (await retorno) {
      final jwt = JWT({
        'name': nome,
        'senha': senha,
      });

      String token = jwt.sign(SecretKey(secretKey));
      print('Token: $token');

      await _secureStorage.salvarToken(token);
      return true;
    }
    return false;
  }

  Future<void> logout() async {
    await _secureStorage.removerToken();
  }
}

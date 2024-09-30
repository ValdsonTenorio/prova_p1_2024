import 'dart:io';

import 'package:novo_projeto/repositorio/Dao.dart';

class Pessoa {
  String _nome;
  String _telefone;
  String _email;
  Pessoa({required nome, required telefone, required email})
      : _email = email,
        _nome = nome,
        _telefone = telefone;

  String get nome => _nome;
  String get telefone => _telefone;
  String get email => _email;
  set nome(String nome) {
    _nome = nome;
  }

  set email(String email) {
    _email = email;
  }

  set telefone(String telefone) {
    _telefone = telefone;
  }
}

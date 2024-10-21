import 'package:shared_preferences/shared_preferences.dart';

class SharedSessao {
  Future<void> salvarToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token);
  }

  Future<String?> carregarToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }

  Future<bool> estaLogado() async {
    final token = await carregarToken();
    return token != null;
  }

  Future<void> removerToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
  }

  Future<bool> login(String usuario, String senha) async {
    print("Tentativa de login com: $usuario / $senha"); 

    return false; 
  }
}

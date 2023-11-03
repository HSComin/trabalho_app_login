import 'dart:convert';
import 'package:app_login/dados.dart';
import 'package:http/http.dart' as http;

Future<http.Response> login(usuario, senha) async{
  const url = 'https://dummyjson.com/auth/login';
  final usuarioData = {
    'username' : usuario,
    'password' : senha
  };
  try {
    final resposta = await http.post(
        Uri.parse(url),
        body: usuarioData
    );
    return resposta;
  }catch(e){
    throw Exception();
  }
}

Future<List<Dados>>getDados() async {
  const baseUrl = 'https://dummyjson.com/users/?q=';
  final resposta = await http.get(Uri.parse(baseUrl));

  final json = jsonDecode(resposta.body)['users'];

  return List<Dados>.from(json.map((elemento) {
    return Dados.fromJson(elemento);
  }));
}



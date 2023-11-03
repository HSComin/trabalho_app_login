import 'dart:convert';
import 'package:app_login/dados.dart';
import 'package:app_login/home.dart';
import 'package:app_login/repositorio.dart';
import 'package:app_login/usuario_login.dart';
import 'package:app_login/usuario_senha.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class TelaLogin extends StatefulWidget {

  const TelaLogin({super.key});

  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  final formKey = GlobalKey<FormState>();
  final usuarioController = TextEditingController();
  final senhaController = TextEditingController();
  bool isLogginIn = false;


  Future<void> loginUsuario() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        isLogginIn = true;
      });
      Response resp = await login(usuarioController.text, senhaController.text);
      List<Dados> resposta = await getDados() as List<Dados>;

      if (resp.statusCode == 200) {
        final usuario = Usuario.fromJson(jsonDecode(resp.body));
        final dados = List<Dados>.from(resposta);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              backgroundColor: Colors.green,
              content: Text('Login Efetuado Com Sucesso',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white
                ),
              )
          ),
        );
        Navigator.push(context, MaterialPageRoute(builder: (context) => Home(usuarioLogin: usuario, dadosUsuario: dados)));
      }else if(resp.statusCode == 400){
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                backgroundColor: Colors.red,
                content: Text('Usuário ou Senha Incorretos',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white
                  ),
                )
            )
        );
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                backgroundColor: Colors.red,
                content: Text('Erro',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white
                  ),
                )
            )
        );
      }
      setState(() {
        isLogginIn = false;
      });
    }
  }


  Future<void> listaUsuario() async {
    List<Dados> resposta = await getDados() as List<Dados>;

    if (resposta.isNotEmpty) {
      final dados = List<Dados>.from(resposta);

      Navigator.push(context, MaterialPageRoute(builder: (context) => UsuarioSenha(dadosUsuario: dados)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Icon(
                Icons.tiktok,
                color: Colors.white,
                size: 150,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40, right: 15, left: 15),
              child: TextFormField(
                validator: (usuario) {
                  if (usuario == null || usuario.isEmpty) {
                    return 'Insira um Usuario';
                  }
                  return null;
                },
                controller: usuarioController,
                decoration: InputDecoration(
                    labelText: 'Usuario',
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)
                    )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextFormField(
                validator: (senha) {
                  if (senha == null || senha.isEmpty) {
                    return 'Insira uma Senha';
                  }
                  return null;
                },
                controller: senhaController,
                obscureText: true,
                decoration: InputDecoration(
                    labelText: 'Senha',
                    prefixIcon: Icon(
                      Icons.password,
                      color: Colors.white,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)
                    )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.white)),
                      onPressed: (){
                        loginUsuario();
                      },
                      child: isLogginIn ? CircularProgressIndicator(backgroundColor: Colors.blue,) : Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5,bottom: 15, left: 15, right: 15),
                    child: ElevatedButton(
                      style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.white)),
                      onPressed: () {
                        listaUsuario();
                      },
                      child: Text(
                        'Lista De Usuarios e Senhas',
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

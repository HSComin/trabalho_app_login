import 'package:app_login/dados.dart';
import 'package:app_login/minha_conta.dart';
import 'package:app_login/tela_login.dart';
import 'package:app_login/usuario_login.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final Usuario usuarioLogin;
  final List<Dados> dadosUsuario;

  const Home({super.key, required this.usuarioLogin, required this.dadosUsuario});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Home'),

      ),
      drawer: Drawer(
        backgroundColor: Colors.black87,
        shadowColor: Colors.white,
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.black),
              accountName: Text(usuarioLogin.nome + ' ' + usuarioLogin.sobrenome),
              accountEmail: Text(usuarioLogin.email),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(usuarioLogin.foto),
                backgroundColor: Colors.grey,
              ),
            ),
            ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => MinhaConta(usuarioLogin: usuarioLogin, dadosUsuario: dadosUsuario)));
              },
              leading: Icon(Icons.person, color: Colors.white,),
              title: Text('Dados da Conta'),
            ),
            ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => TelaLogin()));
              },
              leading: Icon(Icons.exit_to_app),
              title: Text('Sair'),
            ),
          ],
        ),
      ),

      backgroundColor: Colors.black87,
      body: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              children: [
                Center(
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(usuarioLogin.foto),
                    radius: 60,
                    backgroundColor: Colors.grey,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Center(
                    child: Text('Bem vindo(a) ' + usuarioLogin.nome + ' ' + usuarioLogin.sobrenome,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20
                        )
                    ),
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}

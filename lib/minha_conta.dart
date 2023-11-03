import 'package:app_login/dados.dart';
import 'package:app_login/home.dart';
import 'package:app_login/tela_login.dart';
import 'package:app_login/usuario_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MinhaConta extends StatelessWidget {
  final Usuario usuarioLogin;
  final List<Dados> dadosUsuario;

  const MinhaConta({super.key, required this.usuarioLogin, required this.dadosUsuario});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.black87,

        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Minha Conta'),
          actions: [

          ],
        ),

        drawer: Drawer(
          backgroundColor: Colors.black87,
          shadowColor: Colors.white,
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.black),
                accountName: Text(usuarioLogin.nome+ ' ' + usuarioLogin.sobrenome),
                accountEmail: Text(usuarioLogin.email),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(usuarioLogin.foto),
                  backgroundColor: Colors.grey,
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Home(usuarioLogin: usuarioLogin, dadosUsuario: dadosUsuario)));
                },
                leading: Icon(Icons.person, color: Colors.white,),
                title: Text('Home'),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TelaLogin()));
                },
                leading: Icon(Icons.exit_to_app),
                title: Text('Sair'),
              ),
            ],
          ),
        ),

        body:
        ListView.builder(
            itemCount: dadosUsuario.length,
            itemBuilder: ((context, index) {
              final dados = dadosUsuario[index];
              if (usuarioLogin.id == dados.id) {
                if(dados.genero == 'male'){
                  dados.genero = 'Masculino';
                }else{
                  dados.genero = 'Feminino';
                }
                return GestureDetector(
                  child: SingleChildScrollView(
                    child: Center(
                      child: Form(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, left: 15, right: 15),
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(dados.foto),
                                backgroundColor: Colors.black,
                                radius: 50,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, left: 15, right: 15),
                              child: TextFormField(
                                readOnly: true,
                                controller: TextEditingController(
                                    text: dados.id),
                                decoration: InputDecoration(
                                  labelText: 'ID',
                                  prefixIcon: Icon(
                                    CupertinoIcons.number,
                                    color: Colors.white,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 15, left: 15, right: 15),
                              child: TextFormField(
                                readOnly: true,
                                controller: TextEditingController(
                                    text: dados.nome),
                                decoration: InputDecoration(
                                  labelText: 'Nome',
                                  prefixIcon: Icon(
                                    CupertinoIcons.person_crop_circle_fill,
                                    color: Colors.white,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 15, left: 15, right: 15),
                              child: TextFormField(
                                readOnly: true,
                                controller: TextEditingController(
                                    text: dados.sobrenome),
                                decoration: InputDecoration(
                                  labelText: 'Sobrenome',
                                  prefixIcon: Icon(
                                    CupertinoIcons
                                        .person_crop_circle_fill_badge_plus,
                                    color: Colors.white,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 15, left: 15, right: 15),
                              child: TextFormField(
                                readOnly: true,
                                controller: TextEditingController(
                                    text: dados.idade),
                                decoration: InputDecoration(
                                  labelText: 'Idade',
                                  prefixIcon: Icon(
                                    CupertinoIcons.list_number,
                                    color: Colors.white,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 15, left: 15, right: 15),
                              child: TextFormField(
                                readOnly: true,
                                controller: TextEditingController(
                                    text: dados.genero),
                                decoration: InputDecoration(
                                  labelText: 'Gênero',
                                  prefixIcon: Icon(
                                    Icons.transgender,
                                    color: Colors.white,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 15, left: 15, right: 15),
                              child: TextFormField(
                                readOnly: true,
                                controller: TextEditingController(
                                    text: dados.email),
                                decoration: InputDecoration(
                                  labelText: 'Email',
                                  prefixIcon: Icon(
                                    Icons.email_outlined,
                                    color: Colors.white,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 15, left: 15, right: 15),
                              child: TextFormField(
                                readOnly: true,
                                controller: TextEditingController(
                                    text: dados.telefone),
                                decoration: InputDecoration(
                                  labelText: 'Telefone',
                                  prefixIcon: Icon(
                                    Icons.settings_cell_outlined,
                                    color: Colors.white,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 15, left: 15, right: 15),
                              child: TextFormField(
                                readOnly: true,
                                controller: TextEditingController(
                                    text: dados.nome_usuario),
                                decoration: InputDecoration(
                                  labelText: 'Nome de Usuário',
                                  prefixIcon: Icon(
                                    CupertinoIcons.person_crop_rectangle,
                                    color: Colors.white,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 15, left: 15, right: 15),
                              child: TextFormField(
                                readOnly: true,
                                controller: TextEditingController(
                                    text: dados.aniversario),
                                decoration: InputDecoration(
                                  labelText: 'Nascimento AAAA-MM-DD',
                                  prefixIcon: Icon(
                                    Icons.date_range,
                                    color: Colors.white,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 15, left: 15, right: 15),
                              child: TextFormField(
                                readOnly: true,
                                controller: TextEditingController(
                                    text: dados.altura + ' Cm'),
                                decoration: InputDecoration(
                                  labelText: 'Altura',
                                  prefixIcon: Icon(
                                    Icons.horizontal_rule_rounded,
                                    color: Colors.white,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 15, left: 15, right: 15, bottom: 20),
                              child: TextFormField(
                                readOnly: true,
                                controller: TextEditingController(
                                    text: dados.peso + ' Kg'),
                                decoration: InputDecoration(
                                  labelText: 'Peso',
                                  prefixIcon: Icon(
                                    Icons.balance,
                                    color: Colors.white,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }else{
                return Center();
              }
            }
            )
        )
    );
  }
}

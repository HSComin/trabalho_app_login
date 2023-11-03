import 'package:app_login/dados.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class UsuarioSenha extends StatelessWidget {
  final List<Dados> dadosUsuario;

  const UsuarioSenha({super.key, required this.dadosUsuario});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.black87,

        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Lista de Usuarios e Senhas'),
          actions: [

          ],
        ),

        body:
        ListView.builder(
            itemCount: dadosUsuario.length,
            itemBuilder: ((context, index) {
              final dados = dadosUsuario[index];
              return GestureDetector(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 30, bottom: 30, right: 10, left: 10),
                              child: TextField(
                                readOnly: true,
                                controller: TextEditingController(text: dados.nome_usuario),
                                decoration: InputDecoration(
                                  labelText: 'Usuário ' + dados.id,
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
                          ),

                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 30, bottom: 30, right: 10, left: 10),
                              child: TextField(
                                readOnly: true,
                                controller: TextEditingController(text: dados.senha),
                                decoration: InputDecoration(
                                  labelText: 'Senha',
                                  prefixIcon: Icon(
                                    Icons.security,
                                    color: Colors.white,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        child: LinearProgressIndicator(
                          color: Colors.white,
                          backgroundColor: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              );
            }
            )
        )
    );
  }
}

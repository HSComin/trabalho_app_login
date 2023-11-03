class Usuario{
  String id;
  String nome;
  String sobrenome;
  String genero;
  String email;
  String nome_usuario;
  String foto;
  String token;

  Usuario({
    required this.id,
    required this.nome,
    required this.sobrenome,
    required this.genero,
    required this.email,
    required this.nome_usuario,
    required this.foto,
    required this.token,
  });

  Usuario.fromJson(Map<String, dynamic> json)
      :id = json['id'].toString(),
        nome = json['firstName'].toString(),
        sobrenome = json['lastName'].toString(),
        genero = json['gender'].toString(),
        email = json['email'].toString(),
        nome_usuario = json['username'].toString(),
        foto = json['image'].toString(),
        token = json['token'].toString();
}
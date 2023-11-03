class Dados{
  String id;
  String nome;
  String sobrenome;
  String idade;
  String genero;
  String email;
  String telefone;
  String nome_usuario;
  String aniversario;
  String foto;
  String altura;
  String peso;
  String token;
  String senha;

  Dados({
    required this.id,
    required this.nome,
    required this.sobrenome,
    required this.idade,
    required this.genero,
    required this.email,
    required this.telefone,
    required this.nome_usuario,
    required this.foto,
    required this.aniversario,
    required this.altura,
    required this.peso,
    required this.token,
    required this.senha
  });

  Dados.fromJson(Map<String, dynamic> json)
      :id = json['id'].toString(),
        nome = json['firstName'].toString(),
        sobrenome = json['lastName'].toString(),
        idade = json['age'].toString(),
        genero = json['gender'].toString(),
        email = json['email'].toString(),
        telefone = json['phone'].toString(),
        nome_usuario = json['username'].toString(),
        foto = json['image'].toString(),
        aniversario = json['birthDate'].toString(),
        altura = json['height'].toString(),
        peso = json['weight'].toString(),
        token = json['token'].toString(),
        senha = json['password'].toString();
}
class UserDetailsModel{
  final String nome;
  final String endereco;

  UserDetailsModel({required this.nome, required this.endereco});

  Map<String, dynamic> getJson() => {
    'nome': nome,
    'endereco': endereco,
  };
}
class Catalogodoopcoesvestidos {
  int id;
  String nome;
  double preco;
  String urlImage;

  Catalogodoopcoesvestidos({
    required this.id,
    required this.nome,
    required this.preco,
    required this.urlImage,
  });

  Catalogodoopcoesvestidos.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        nome = json['nome'],
        preco = json['preco'],
        urlImage = json['url_image'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'preco': preco,
      'url_image': urlImage,
    };
  }
}

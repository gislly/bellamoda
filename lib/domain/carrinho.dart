class Carrinho {
  late int id;
  late String urlImage;
  late String titulo;
  late String preco;
  late String descricao;

  Carrinho({
    required this.id,
    required this.urlImage,
    required this.titulo,
    required this.preco,
    required this.descricao,
  });

  Carrinho.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    urlImage = json['url_image'];
    titulo = json['titulo'];
    preco = json['preco'];
    descricao = json['descricao'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};

    json['url_image'] = urlImage;
    json['titulo'] = titulo;
    json['preco'] = preco;
    json['descricao'] = descricao;

    return json;
  }
}

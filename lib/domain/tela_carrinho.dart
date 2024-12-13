class TelaCarrinho {
  late String urlImage;
  late String titulo;
  late String preco;
  late String descricao;

  TelaCarrinho({
    required this.urlImage,
    required this.titulo,
    required this.preco,
    required this.descricao,
  });

  TelaCarrinho.fromJson(Map<String, dynamic> json) {
    urlImage = json['url_image'];
    titulo = json['titulo'];
    descricao = json['descricao'];
    preco = json['preco'];
  }
}

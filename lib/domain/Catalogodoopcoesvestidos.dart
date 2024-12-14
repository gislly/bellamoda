class Catalogodoopcoesvestidos {
  int id;
  String titulo;
  double preco;
  String urlImage;

  Catalogodoopcoesvestidos({
    required this.id,
    required this.titulo,
    required this.preco,
    required this.urlImage,
  });

  Catalogodoopcoesvestidos.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        titulo = json['titulo'],
        preco = json['preco'],
        urlImage = json['url_image'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titulo': titulo,
      'preco': preco,
      'url_image': urlImage,
    };
  }
}

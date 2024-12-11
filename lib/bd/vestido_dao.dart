class Catalogodoopcoesvestidos {
  String urlImage;
  String titulo;
  String preco;

  Catalogodoopcoesvestidos({
    required this.urlImage,
    required this.titulo,
    required this.preco,
  });

  factory Catalogodoopcoesvestidos.fromJson(Map<String, dynamic> json) {
    return Catalogodoopcoesvestidos(
      urlImage: json['url_image'],
      titulo: json['titulo'],
      preco: json['preco'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'url_image': urlImage,
      'titulo': titulo,
      'preco': preco,
    };
  }
}
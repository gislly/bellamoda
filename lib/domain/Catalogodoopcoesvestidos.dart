class Catalogodoopcoesvestidos {
  String urlImage;
  String titulo;
  String preco;

  Catalogodoopcoesvestidos({
    required this.urlImage,
    required this.titulo,
    required this.preco,
  });

  static Catalogodoopcoesvestidos fromJson(Map<String, Object?> json) {
    return Catalogodoopcoesvestidos(
      urlImage: json['urlImage'] as String,
      titulo: json['titulo'] as String,
      preco: json['preco'] as String,
    );
  }
}

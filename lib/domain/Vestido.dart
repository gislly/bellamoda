class Vestido {
  String urlImage;
  String titulo;
  String preco;

  Vestido({
    required this.urlImage,
    required this.titulo,
    required this.preco,
  });

  static Vestido fromJson(Map<String, Object?> json) {
    return Vestido(
      urlImage: json['urlImage'] as String,
      titulo: json['titulo'] as String,
      preco: json['preco'] as String,
    );
  }
}

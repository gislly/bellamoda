class Vestuario {
  late int id;
  late String urlImage;
  late String titulo;

  Vestuario({
    required this.id,
    required this.urlImage,
    required this.titulo,
  });

  Vestuario.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    urlImage = json['url_image'];
    titulo = json['titulo'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'url_image': urlImage,
      'titulo': titulo,
    };
  }
}

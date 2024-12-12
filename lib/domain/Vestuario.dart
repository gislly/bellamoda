class Vestuario {
  late String title;
  late String imageUrl;

  Vestuario({
    required this.title,
    required this.imageUrl,
  });

  factory Vestuario.fromJson(Map<String, dynamic> json) {
    return Vestuario(
      title: json['title'],
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'imageUrl': imageUrl,
    };
  }
}

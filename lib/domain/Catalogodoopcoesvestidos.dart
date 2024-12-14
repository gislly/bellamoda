class Catalogodoopcoesvestidos {
  int id;
  String nome;
  double preco;
  String urlImagem;

  Catalogodoopcoesvestidos({
    required this.id,
    required this.nome,
    required this.preco,
    required this.urlImagem,
  });

  Catalogodoopcoesvestidos.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        nome = json['nome'],
        preco = json['preco'],
        urlImagem = json['url_imagem'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'preco': preco,
      'url_imagem': urlImagem,
    };
  }
}

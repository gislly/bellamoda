import 'package:untitled1/domain/vestuario.dart'; // Certifique-se de que a importação está correta

class Database {
  static List<Vestuario> roupas = [
    Vestuario(
      id: 0,
      titulo: 'Vestidos',
      urlImage:
      'https://mirak.jetassets.com.br/produto/20240428133903_9465990535_D.jpg',
    ),
    Vestuario(
      id: 0,
      titulo: 'Blusas', // Correção para o campo 'titulo'
      urlImage:
      'https://mirak.jetassets.com.br/produto/20240706225809_4933995067_D.jpg',
    ),
    Vestuario(
      id: 0,
      titulo: 'Calças', // Correção para o campo 'titulo'
      urlImage:
      'https://mirak.jetassets.com.br/produto/20240227170612_391999609_D.jpg',
    ),
    Vestuario(
      id: 0,
      titulo: 'Shorts', // Correção para o campo 'titulo'
      urlImage:
      'https://mirak.jetassets.com.br/produto/20240131075255_91999909_D.jpg',
    ),
  ];
}

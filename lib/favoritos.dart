import 'package:flutter/material.dart';

class FavoritosPage extends StatelessWidget {
  const FavoritosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAVORITOS'),
        backgroundColor: Colors.brown,
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Text(
            'Itens (4)',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Image.network('https://mirak.jetassets.com.br/produto/20240627090633_6861993139_D.jpg', height: 200),
                  Text('CALÇA LACE'),
                ],
              ),
              Column(
                children: [
                  Image.network('https://mirak.jetassets.com.br/produto/20240627090633_6861993139_D.jpg', height: 200),
                  Text('VESTIDO CLÉO'),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Image.network('https://mirak.jetassets.com.br/produto/20240627090633_6861993139_D.jpg', height: 200),
                  Text('SHORT LAYNE'),
                ],
              ),
              Column(
                children: [
                  Image.network('https://mirak.jetassets.com.br/produto/20240627090633_6861993139_D.jpg', height: 200),
                  Text('VESTIDO AURORA'),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            'Adicione itens favoritos à sua lista!',
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
        ],
      ),
    );
  }
}



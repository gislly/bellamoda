import 'package:flutter/material.dart';

class Short3Page extends StatefulWidget {
  const Short3Page({super.key});

  @override
  State<Short3Page> createState() => _Short3PageState();
}

class _Short3PageState extends State<Short3Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BELLA MODA',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFFB6A298),
        actions: [
          IconButton(
              onPressed: () {}, icon: Icon(Icons.search, color: Colors.white)),
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.shopping_cart, color: Colors.white)),
          IconButton(
              onPressed: () {}, icon: Icon(Icons.person, color: Colors.white)),
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_vert, color: Colors.white)),
        ],
      ),
      body: ListView(
        children: [
          Image.network(
            'https://mirak.jetassets.com.br/produto/multifotos/20240917172909_2241997759_DM.jpg',
            height: 400,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'SHORT ALFAIATARIA ANTÔNIA TUTTI FRUTTI',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'R\$ 498,00',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.brown,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'TAMANHO',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizeOption(size: 'PP'),
                    SizeOption(size: 'P'),
                    SizeOption(size: 'M'),
                    SizeOption(size: 'G'),
                    SizeOption(size: 'GG'),
                  ],
                ),
                SizedBox(height: 16),
                Text(
                  'DESCRIÇÃO:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'O Short Alfaiataria Antônia Tutti Frutti é a escolha perfeita para quem deseja adicionar uma explosão de cor ao guarda-roupa. Confeccionado em tecido leve e de alta qualidade, proporciona conforto e um caimento perfeito. Ideal para dias quentes, esse short pode ser facilmente combinado com blusas básicas ou estampadas, trazendo um toque vibrante a qualquer look.',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFFB6A298),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.shopping_cart, color: Colors.white),
              label: Text(
                'Comprar agora',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF4A2C2A),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SizeOption extends StatelessWidget {
  final String size;

  const SizeOption({required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        size,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}

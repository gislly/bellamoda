import 'package:flutter/material.dart';
import 'package:untitled1/domain/Catalogodovestido.dart';

import 'bd/Databasedovestido.dart';

class VestidoPage extends StatefulWidget {
  const VestidoPage({super.key});

  @override
  State<VestidoPage> createState() => _VestidoPageState();
}

class _VestidoPageState extends State<VestidoPage> {
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
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: Database.pacotes.length,
            itemBuilder: (context, index) {
              return ItemCatalogoCard(
                itemCatalogo: Database.pacotes[index],
              );
            },
          ),
        ],
      ),
    );
  }
}


class ItemCatalogoCard extends StatelessWidget {
  final Catalogodovestido itemCatalogo;

  const ItemCatalogoCard({required this.itemCatalogo, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            itemCatalogo.urlImage,
            height: 400,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  itemCatalogo.nome,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'R\$ ${itemCatalogo.preco.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.brown,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'TAMANHOS: ${itemCatalogo.tamanhos}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
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
                  itemCatalogo.descricao,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),
                ElevatedButton.icon(
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}

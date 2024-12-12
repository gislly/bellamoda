import 'package:flutter/material.dart';
import 'package:untitled1/carrinho_page.dart';
import 'package:untitled1/pesquisa_delegate.dart';
import 'package:untitled1/perfil.dart';
import 'package:untitled1/vestidos.dart';
import 'package:untitled1/blusas.dart';
import 'package:untitled1/calcas.dart';
import 'package:untitled1/shorts.dart';
import 'package:untitled1/bd/databaseduda.dart';
import 'package:untitled1/domain/Vestuario.dart';
import 'package:untitled1/bd/vestuario_dao.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List<Vestuario> roupas = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    roupas = await VestuarioDao().listarRoupas();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'BELLA MODA',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFFA1887F),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: PesquisaDelegate(),
              );
            },
            icon: Icon(Icons.search, color: Colors.white),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Perfil()),
              );
            },
            icon: Icon(Icons.person, color: Colors.white),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CarrinhoPage()),
              );
            },
            icon: Icon(Icons.shopping_cart, color: Colors.white),
          ),
        ],
      ),
      backgroundColor: Color(0xFFEFEBE9),
      body: ListView(
        children: [
          // Banner de propaganda
          Container(
            height: 250,
            child: Image.network(
              'https://mirak.jetassets.com.br/produto/20240227165413_253999747_D.jpg',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Home > PREVIEW 25', style: TextStyle(fontSize: 14)),
                SizedBox(height: 4),
                Text(
                  'PREVIEW 25',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('FIQUE POR DENTRO DAS NOVIDADES',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                SizedBox(height: 16),
                // Exibindo as categorias de roupas carregadas do banco de dados
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: roupas.length,
                  itemBuilder: (context, i) {
                    return GestureDetector(
                      onTap: () {
                        switch (i) {
                          case 0:
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const Vestidos()),
                            );
                            break;
                          case 1:
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const Blusas()),
                            );
                            break;
                          case 2:
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const Calcas()),
                            );
                            break;
                          case 3:
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const Shorts()),
                            );
                            break;
                          default:
                            break;
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          children: [
                            // Exibe a imagem e título da categoria
                            Image.network(
                              roupas[i].imageUrl,
                              height: 160,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 16),
                                  Text(
                                    roupas[i].title,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Container(
            color: Color(0xFFA1887F),
            padding: EdgeInsets.all(14.0),
            child: Column(
              children: [
                Text('ENTREGA EXPRESSA', style: TextStyle(color: Colors.white)),
                Text('TROCA FÁCIL', style: TextStyle(color: Colors.white)),
                Text('FRETE GRÁTIS', style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

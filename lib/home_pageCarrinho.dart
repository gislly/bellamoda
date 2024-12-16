import '/domain/carrinho.dart';
import '/bd/db_helper.dart';
import '/bd/databaseCarrinho.dart';
import '/domain/carrinho.dart';
import '/bd/carrinho_dao.dart';
import 'tela_vestido.dart';
import 'tela_short.dart';
import 'tela_calca.dart';
import 'register_userCarrinho.dart';
import 'package:flutter/material.dart';
class HomePageCarrinho extends StatefulWidget {
  const HomePageCarrinho({super.key});
  @override
  State<HomePageCarrinho> createState() =>
      _HomePageCarrinhoState();
}
class _HomePageCarrinhoState extends State<HomePageCarrinho> {
  late Future<List<Carrinho>>
  carrinho;
  @override
  void initState() {
    super.initState();
    carrinho = CarrinhoDao()
        .listarPecas();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFEBE9),
      appBar: AppBar(
        backgroundColor: const Color(0xFFA1887F),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color:

              Colors.white),

              onPressed: () {
                Navigator.pop(context);
              },
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward,
                  color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegisterCarrinho(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: FutureBuilder<List<Carrinho>>(
        future: carrinho,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)

          {

            return const Center(child:

            CircularProgressIndicator());

          }
          if (snapshot.hasError) {
            return Center(child: Text('Erro ao carregar pacotes'));
          }
          List<Carrinho> pecas = snapshot
              .data!;

          return ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: pecas.length,
            itemBuilder: (context, i) {
              return GestureDetector(
                onTap: () {
                  if (i == 0) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const

                          TelaVestidoPage()),
                    );
                  } else if (i == 1) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const

                          TelaShortPage()),
                    );
                  } else if (i == 2) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const

                          TelaCalcaPage()),
                    );
                  }
                },
                child: Card(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        pecas[i].urlImage,
                        height: 160,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment:

                          CrossAxisAlignment.start,

                          children: [
                            SizedBox(height: 30),
                            Text(
                              pecas[i].titulo,

                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 16),
                            Text(
                              pecas[i].preco,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 16),
                            Text(
                              pecas[i].descricao,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
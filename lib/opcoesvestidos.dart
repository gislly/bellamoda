import 'package:flutter/material.dart';
import 'package:untitled1/bd/Databasedoopcoesvestidos.dart';
import 'package:untitled1/bd/vestido_dao.dart';
import 'package:untitled1/carrinho.dart';
import 'package:untitled1/Vestido2_page.dart';
import 'package:untitled1/Vestido3_page.dart';
import 'package:untitled1/Vestido_page.dart';
import 'package:untitled1/favoritos.dart';
import 'domain/Catalogodoopcoesvestidos.dart';


class SegundaPagina extends StatefulWidget {
  const SegundaPagina({super.key});

  @override
  State<SegundaPagina> createState() => _SegundaPaginaState();
}

class _SegundaPaginaState extends State<SegundaPagina> {
  List<> vestidos = [];
  bool showSearchField = false;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    vestidos = await VestidoDao().listarVestidos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFAF1EB),
        title: showSearchField
            ? const TextField(decoration: InputDecoration(hintText: 'Pesquisar'))
            : const Text('Segunda Página'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF3A1B0F)),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                showSearchField = !showSearchField;
              });
            },
            icon: const Icon(Icons.search, color: Color(0xFFA4633E)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Center(
              child: Text(
                'VESTIDOS',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 16),
            _buildList(Database.pacotes, const VestidoPage()),
            _buildList(Database2.pacotes, const Vestido2Page()),
            _buildList(Database3.pacotes, const Vestido3Page()),
          ],
        ),
      ),
    );
  }

  Widget _buildList(List<Catalogodoopcoesvestidos> pacotes, Widget page) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: pacotes.length,
      itemBuilder: (context, i) {
        return _buildCardPacote(pacotes[i], page);
      },
    );
  }

  Widget _buildCardPacote(Catalogodoopcoesvestidos pacote, Widget page) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      pacote.urlImage,
                      width: 100,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          pacote.titulo,
                          style: const TextStyle(
                            fontSize: 15.7,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'R\$ ${pacote.preco}',
                          style: const TextStyle(
                            fontSize: 10.5,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                    const CarrinhoPage(),
                                  ),
                                );
                              },
                              icon: const Icon(Icons.shopping_cart,
                                  color: Color(0xFFD6C3B6)),
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                    const FavoritosPage(),
                                  ),
                                );
                              },
                              icon: const Icon(Icons.favorite,
                                  color: Color(0xFFD6C3B6)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


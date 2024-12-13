import 'package:flutter/material.dart';
import 'package:untitled1/bd/Databasedoopcoesvestidos.dart';
import 'package:untitled1/carrinho_page.dart';
import 'package:untitled1/domain/Catalogodovestido.dart';
import 'package:untitled1/Vestido2_page.dart';
import 'package:untitled1/Vestido3_page.dart';
import 'package:untitled1/Vestido_page.dart';
import 'package:untitled1/favoritos.dart';
import 'package:untitled1/login.dart';
import 'domain/Catalogodoopcoesvestidos.dart';
import 'package:untitled1/bd/vestido_dao.dart'; // Nome correto do arquivo


class SegundaPagina extends StatefulWidget {
  const SegundaPagina({super.key});

  @override
  State<SegundaPagina> createState() => _SegundaPaginaState();
}

class _SegundaPaginaState extends State<SegundaPagina> {
  List<Catalogodoopcoesvestidos> vestidos = [];
  bool showSearchField = false;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    vestidos = (await VestidoDao().listarVestidos()).cast<Catalogodoopcoesvestidos>();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFAF1EB),
        title: showSearchField
            ? const TextField(
          decoration: InputDecoration(
            hintText: 'Pesquisar...',
            border: InputBorder.none,
          ),
        )
            : const Text(
          'VESTIDOS',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w300,
          ),
        ),
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
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: Database.pacotes.length,
              itemBuilder: (context, i) {
                return buildCardPacote(Database.pacotes[i] as Catalogodoopcoesvestidos);
              },
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: Database2.pacotes.length,
              itemBuilder: (context, i) {
                return buildCardVestido2(Database2.pacotes[i] as Catalogodoopcoesvestidos);
              },
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: Database3.pacotes.length,
              itemBuilder: (context, i) {
                return buildCardVestido3(Database3.pacotes[i] as Catalogodoopcoesvestidos);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCardPacote(Catalogodoopcoesvestidos catalogoVestido) {
    return buildCard(catalogoVestido, const VestidoPage());
  }

  Widget buildCardVestido2(Catalogodoopcoesvestidos catalogoVestido2) {
    return buildCard(catalogoVestido2, const Vestido2Page());
  }

  Widget buildCardVestido3(Catalogodoopcoesvestidos catalogoVestido3) {
    return buildCard(catalogoVestido3, const Vestido3Page());
  }

  Widget buildCard(Catalogodoopcoesvestidos catalogoVestido, Widget page) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => page,
          ),
        );
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
                      catalogoVestido.urlImage,
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
                          catalogoVestido.titulo,
                          style: const TextStyle(
                            fontSize: 15.7,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'R\$ ${catalogoVestido.preco}',
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
                                    builder: (context) => const CarrinhoPage(),
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
                                    builder: (context) => const FavoritosPage(),
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

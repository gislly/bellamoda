import 'package:flutter/material.dart';
import 'package:untitled1/bd/Databasedoopcoesvestidos.dart';
import 'package:untitled1/carrinho.dart';
import 'package:untitled1/domain/Catalogodovestido.dart';
import 'package:untitled1/Vestido2_page.dart';
import 'package:untitled1/Vestido3_page.dart';
import 'package:untitled1/Vestido_page.dart';
import 'package:untitled1/favoritos.dart';
import 'package:untitled1/login.dart';
import 'domain/Catalogodoopcoesvestidos.dart';

class SegundaPagina extends StatefulWidget {
  const SegundaPagina({super.key});

  @override
  State<SegundaPagina> createState() => _SegundaPaginaState();
}

class _SegundaPaginaState extends State<SegundaPagina> {
  bool showSearchField = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFAF1EB),
        title: showSearchField ? TextField() : Container(),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const HomePage();
                },
              ),
            );
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
            icon: Icon(Icons.search, color: Color(0xFFA4633E)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Center(
              child: Text('VESTIDOS',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w300,
                      color: Colors.black)),
            ),
            SizedBox(height: 16),




            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: Database.pacotes.length,
              itemBuilder: (context, i) {
                return buildCardPacote(Database.pacotes[i]);
              },
            ),


            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: Database2.pacotes.length,
              itemBuilder: (context, i) {
                return buildCardVestido2(Database2.pacotes[i]);
              },
            ),


            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: Database3.pacotes.length,
              itemBuilder: (context, i) {
                return buildCardVestido3(Database3.pacotes[i]);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCardPacote(Catalogodoopcoesvestidos catalogoVestido) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const VestidoPage();
            },
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
                          '${catalogoVestido.titulo}',
                          style: TextStyle(
                            fontSize: 15.7,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'R\$ ${catalogoVestido.preco}',
                          style: TextStyle(
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
                                    builder: (context) {
                                      return const CarrinhoPage();
                                    },
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
                                    builder: (context) {
                                      return const FavoritosPage();
                                    },
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

  Widget buildCardVestido2(Catalogodoopcoesvestidos catalogoVestido2) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const Vestido2Page();
            },
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
                      catalogoVestido2.urlImage,
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
                          '${catalogoVestido2.titulo}',
                          style: TextStyle(
                            fontSize: 15.7,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'R\$ ${catalogoVestido2.preco}',
                          style: TextStyle(
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
                                    builder: (context) {
                                      return const CarrinhoPage();
                                    },
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
                                    builder: (context) {
                                      return const FavoritosPage();
                                    },
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

  Widget buildCardVestido3(Catalogodoopcoesvestidos catalogoVestido3) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const Vestido3Page();
            },
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
                      catalogoVestido3.urlImage,
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
                          '${catalogoVestido3.titulo}',
                          style: TextStyle(
                            fontSize: 15.7,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'R\$ ${catalogoVestido3.preco}',
                          style: TextStyle(
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
                                    builder: (context) {
                                      return const CarrinhoPage();
                                    },
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
                                    builder: (context) {
                                      return const FavoritosPage();
                                    },
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

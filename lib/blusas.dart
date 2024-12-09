import 'package:flutter/material.dart';

class Blusas extends StatefulWidget {
  const Blusas({super.key});

  @override
  State<Blusas> createState() => BlusasState();
}

class BlusasState extends State<Blusas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF1EB),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context); // Volta para a tela anterior
          },
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF3A1B0F)),
        ),
        title: const Text(
          'Blusas',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: const Color(0xFFA1887F),
        actions: [
          IconButton(
            onPressed: () {
              // Ação para pesquisa (adapte conforme necessário)
            },
            icon: const Icon(Icons.search, color: Color(0xFFA4633E)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Center(
              child: Text(
                'BLUSAS',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  // Primeira blusa
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              'https://mirak.jetassets.com.br/produto/20240808173220_8877991123_D.jpg',
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
                                const Text(
                                  'BLUSA TRICOT GRETA NUDE COFFEE',
                                  style: TextStyle(
                                    fontSize: 15.7,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                  'R\$ 120,00',
                                  style: TextStyle(
                                    fontSize: 10.5,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.shopping_cart,
                                          color: Color(0xFFD6C3B6)),
                                    ),
                                    IconButton(
                                      onPressed: () {},
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
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Segunda blusa
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              'https://mirak.jetassets.com.br/produto/20240808174106_9485990515_D.jpg',
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
                                const Text(
                                  'BLUSA TRICOT NIKKI NATURAL',
                                  style: TextStyle(
                                    fontSize: 15.7,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                  'R\$ 90,00',
                                  style: TextStyle(
                                    fontSize: 10.5,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.shopping_cart,
                                          color: Color(0xFFD6C3B6)),
                                    ),
                                    IconButton(
                                      onPressed: () {},
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
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Terceira blusa
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              'https://mirak.jetassets.com.br/produto/20240808170914_4955995045_D.jpg',
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
                                const Text(
                                  'BLUSA TRICOT NIKKI PRETA',
                                  style: TextStyle(
                                    fontSize: 15.7,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                  'R\$ 110,00',
                                  style: TextStyle(
                                    fontSize: 10.5,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.shopping_cart,
                                          color: Color(0xFFD6C3B6)),
                                    ),
                                    IconButton(
                                      onPressed: () {},
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
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

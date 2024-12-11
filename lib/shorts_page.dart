import 'package:flutter/material.dart';

class Shorts extends StatefulWidget {
  const Shorts({super.key});

  @override
  State<Shorts> createState() => ShortsState();
}

class ShortsState extends State<Shorts> {
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
          'Shorts',
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
            Center(
              child: const Text(
                'SHORTS',
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
                  // Primeiro short
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
                              'https://mirak.jetassets.com.br/produto/multifotos/20240918151611_5238994762_DM.jpg',
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
                                  'SHORT ALFAIATARIA CORINA PRETO',
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

                  // Segundo short
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
                              'https://mirak.jetassets.com.br/produto/multifotos/20240917172909_2241997759_DM.jpg',
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
                                  'SHORT ALFAIATARIA ANTÔNIA TUTTI FRUTTI',
                                  style: TextStyle(
                                    fontSize: 15.7,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                  'R\$ 130,00',
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

                  // Terceiro short
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
                              'https://mirak.jetassets.com.br/produto/multifotos/20241015142024_6649993351_DM.jpg',
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
                                  'SHORT ALFAIATARIA MIRANDA ROSA BLUSH',
                                  style: TextStyle(
                                    fontSize: 15.7,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                  'R\$ 140,00',
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

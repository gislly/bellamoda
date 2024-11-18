import 'package:flutter/material.dart';
import 'package:untitled1/opcoesvestidos.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              onPressed: () {}, icon: Icon(Icons.search, color: Colors.white)),
          IconButton(
              onPressed: () {}, icon: Icon(Icons.person, color: Colors.white)),
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.shopping_cart, color: Colors.white)),
        ],
      ),
      backgroundColor: Color(0xFFEFEBE9),
      body: ListView(
        children: [
          Container(
              height: 250,
              child: Image.network(
                'https://mirak.jetassets.com.br/produto/20240227165413_253999747_D.jpg',
                fit: BoxFit.cover,
              )),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Home > PREVIEW 25', style: TextStyle(fontSize: 14)),
                SizedBox(height: 4),
                Text('PREVIEW 25',
                    style:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFA1887F),
                    ),
                    child: Text('FILTRO', style: TextStyle(color: Colors.white),)),
                SizedBox(width: 10),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFA1887F),
                    ),
                    child: Text('ORDENAR POR >', style: TextStyle(color: Colors.white),)),
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
                    style:
                    TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => SegundaPagina()),
                              );
                            },
                            child: CircleAvatar(
                              radius: 60,
                              backgroundImage: NetworkImage(
                                'https://mirak.jetassets.com.br/produto/20240428133903_9465990535_D.jpg',
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Text('VESTIDOS'),
                        ],
                      ),
                    ),

                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundImage: NetworkImage(
                                'https://mirak.jetassets.com.br/produto/20240706225809_4933995067_D.jpg'),
                          ),
                          SizedBox(height: 8),
                          Text('BLUSAS'),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundImage: NetworkImage(
                                'https://mirak.jetassets.com.br/produto/20240227170612_391999609_D.jpg'),
                          ),
                          SizedBox(height: 8),
                          Text('CALÇAS'),
                        ],
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundImage: NetworkImage(
                                'https://mirak.jetassets.com.br/produto/20240131075255_91999909_D.jpg'),
                          ),
                          SizedBox(height: 8),
                          Text('SHORTS'),
                        ],
                      ),
                    ),
                  ],
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
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.chat)),
                IconButton(onPressed: () {}, icon: Icon(Icons.email)),
                IconButton(onPressed: () {}, icon: Icon(Icons.thumb_up)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
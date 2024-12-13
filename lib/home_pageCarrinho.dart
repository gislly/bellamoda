import 'package:flutter/material.dart';
import 'package:untitled1/bd/carrinho_dao.dart';
import 'package:untitled1/domain/tela_carrinho.dart';

class HomePageAlanna extends StatefulWidget {
  const HomePageAlanna({super.key});

  @override
  State<HomePageAlanna> createState() => _HomePageAlannaState();
}

class _HomePageAlannaState extends State<HomePageAlanna> {
  late Future<List<TelaCarrinho>> pacotes;

  @override
  void initState() {
    super.initState();
    pacotes = CarrinhoDao().listarPacotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFEBE9),
      appBar: AppBar(
        backgroundColor: const Color(0xFFA1887F),
        title: const Text('Carrinho'),
      ),
      body: FutureBuilder<List<TelaCarrinho>>(
        future: pacotes,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(child: Text('Erro ao carregar pacotes'));
          }

          if (snapshot.data == null || snapshot.data!.isEmpty) {
            return const Center(child: Text('Nenhum pacote disponível'));
          }

          List<TelaCarrinho> pacotes = snapshot.data!;
          return ListView.builder(
            itemCount: pacotes.length,
            itemBuilder: (context, i) {
              return Card(
                child: ListTile(
                  leading: Image.network(
                    pacotes[i].urlImage,
                    height: 50,
                    width: 50,
                  ),
                  title: Text(pacotes[i].titulo),
                  subtitle: Text('${pacotes[i].descricao} - ${pacotes[i].preco}'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

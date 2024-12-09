import 'package:flutter/material.dart';
import 'package:untitled1/Vestido_page.dart';
import 'Vestido_page.dart';
import 'Vestido2_page.dart';
import 'blusa_page.dart';
import 'blusa2_page.dart';
import 'blusa3_page.dart';
import 'calca_page.dart';
import 'calca2_page.dart';
import 'calca3_page.dart';
import 'short_page.dart';
import 'short3_page.dart';

class PesquisaDelegate extends SearchDelegate<String> {
  final List<String> roupas = const [
    "Vestido Diana Midi Azul Marinho",
    "Vestido Noemia Off White",
    "Blusa Tricot Nikki Preto",
    "Blusa Tricot Nikki Natural",
    "Blusa Tricot Greta Nude Coffee",
    "Calça Alfaiataria Antônia Preto",
    "Calça Taylor Jeans Média",
    "Calça Jeans Leandra Jeans Claro",
    "Short Alfaiataria Corina Preto",
    "Short Alfaiataria Antônia Tutti Frutti",
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<String> resultados = roupas
        .where((roupa) => roupa.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: resultados.length,
      itemBuilder: (context, index) {
        final roupa = resultados[index];
        return ListTile(
          title: Text(roupa),
          onTap: () {
            _navigateToPage(context, roupa);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<String> sugestoes = roupas
        .where((roupa) => roupa.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: sugestoes.length,
      itemBuilder: (context, index) {
        final roupa = sugestoes[index];
        return ListTile(
          title: Text(roupa),
          onTap: () {
            query = roupa;
            _navigateToPage(context, roupa);
          },
        );
      },
    );
  }

  void _navigateToPage(BuildContext context, String roupa) {
    switch (roupa) {
      case "Vestido Diana Midi Azul Marinho":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const VestidoPage()),
        );
        break;
      case "Vestido Noemia Off White":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Vestido2Page()),
        );
        break;
      case "Blusa Tricot Nikki Preto":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const BlusaPage()),
        );
        break;
      case "Blusa Tricot Nikki Natural":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Blusa2Page()),
        );
        break;
      case "Blusa Tricot Greta Nude Coffee":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Blusa3Page()),
        );
        break;
      case "Calça Alfaiataria Antônia Preto":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CalcaPage()),
        );
        break;
      case "Calça Taylor Jeans Média":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Calca2Page()),
        );
        break;
      case "Calça Jeans Leandra Jeans Claro":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Calca3Page()),
        );
        break;
      case "Short Alfaiataria Corina Preto":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ShortPage()),
        );
        break;
      case "Short Alfaiataria Antônia Tutti Frutti":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Short3Page()),
        );
        break;
      default:
        break;
    }
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/bd/carrinho_dao.dart';
import '/domain/carrinho.dart';
class RegisterCarrinho extends StatefulWidget {
  const RegisterCarrinho({super.key});
  @override
  State<RegisterCarrinho> createState() =>
      _RegisterCarrinhoState();

}
class _RegisterCarrinhoState extends State<RegisterCarrinho> {
  final TextEditingController tituloController =
  TextEditingController();
  final TextEditingController precoController =
  TextEditingController();
  final TextEditingController descricaoController =
  TextEditingController();
  final TextEditingController urlImageController =
  TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFA1887F),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              buildTextFormField(controller: tituloController,

                  label: 'Título'),

              buildTextFormField(controller: precoController,

                  label: 'Preço'),

              buildTextFormField(
                  controller: descricaoController, label:

              'Descrição'),

              buildTextFormField(
                  controller: urlImageController, label: 'URL da Imagem'),

                  SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFA1887F),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onPressed: onSavePressed,
                child: const Text(
                  'Cadastrar Pacote',
                  style: TextStyle(fontSize: 16, fontWeight:

                  FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget buildTextFormField({
    required TextEditingController controller,
    required String label,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          floatingLabelStyle: GoogleFonts.montserrat(
            color: const Color(0xFFA1887F),
            fontWeight: FontWeight.w600,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(width: 2, color:

            Color(0xFFA1887F)),

          ),
        ),
        cursorColor: const Color(0xFFA1887F),
      ),
    );
  }
  void onSavePressed() {
    final String titulo = tituloController.text;
    final String preco = precoController.text;
    final String descricao = descricaoController.text;
    final String urlImage = urlImageController.text;
    if (titulo.isEmpty ||
        preco.isEmpty ||
        descricao.isEmpty ||
        urlImage.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Todos os campos são obrigatórios!')),

          );
              return;
          }
              await CarrinhoDao().salvarCarrinho(carrinho);
          Navigator.pop(context);
    }
}
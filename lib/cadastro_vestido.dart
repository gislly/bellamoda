import 'package:flutter/material.dart';

class CadastrarVestidos extends StatefulWidget {
  const CadastrarVestidos({super.key});

  @override
  State<CadastrarVestidos> createState() => _CadastrarVestidosState();
}

class _CadastrarVestidosState extends State<CadastrarVestidos> {
  final TextEditingController nomeController1 = TextEditingController();
  final TextEditingController precoController1 = TextEditingController();
  final TextEditingController imageUrlController1 = TextEditingController();

  final TextEditingController nomeController2 = TextEditingController();
  final TextEditingController precoController2 = TextEditingController();
  final TextEditingController imageUrlController2 = TextEditingController();

  final TextEditingController nomeController3 = TextEditingController();
  final TextEditingController precoController3 = TextEditingController();
  final TextEditingController imageUrlController3 = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Cadastrar Vestidos',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          backgroundColor: const Color(0xFFA1887F),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  buildVestidoForm(1, nomeController1, precoController1, imageUrlController1),
                  const SizedBox(height: 16),
                  buildVestidoForm(2, nomeController2, precoController2, imageUrlController2),
                  const SizedBox(height: 16),
                  buildVestidoForm(3, nomeController3, precoController3, imageUrlController3),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: onSave,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE81F7C),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        'Salvar',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildVestidoForm(
      int index, TextEditingController nomeController, TextEditingController precoController, TextEditingController imageUrlController) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Vestido $index',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: nomeController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'O nome é obrigatório!';
            }
            return null;
          },
          decoration: buildInputDecoration('Nome'),
          cursorColor: const Color(0xFF10397B),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: precoController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'O preço é obrigatório!';
            }
            return null;
          },
          decoration: buildInputDecoration('Preço'),
          cursorColor: const Color(0xFF10397B),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: imageUrlController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'A URL da imagem é obrigatória!';
            }
            return null;
          },
          decoration: buildInputDecoration('URL da Imagem'),
          cursorColor: const Color(0xFF10397B),
        ),
      ],
    );
  }

  InputDecoration buildInputDecoration(String label) {
    return InputDecoration(
      label: Text(label),
      floatingLabelStyle: const TextStyle(
        color: Color(0xFF10397B),
        fontWeight: FontWeight.w600,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          width: 2,
          color: Color(0xFF10397B),
        ),
      ),
    );
  }

  Future<void> onSave() async {
    if (formKey.currentState!.validate()) {
      String nome1 = nomeController1.text;
      String preco1 = precoController1.text;
      String imageUrl1 = imageUrlController1.text;

      String nome2 = nomeController2.text;
      String preco2 = precoController2.text;
      String imageUrl2 = imageUrlController2.text;

      String nome3 = nomeController3.text;
      String preco3 = precoController3.text;
      String imageUrl3 = imageUrlController3.text;

      // Salvar os dados ou fazer algo com eles
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Vestidos cadastrados com sucesso!')),
      );

      Navigator.pop(context);
    }
  }
}

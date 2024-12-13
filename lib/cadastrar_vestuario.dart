import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled1/bd/vestuario_dao.dart';
import 'package:untitled1/domain/Vestuario.dart';

class CadastrarVestuario extends StatefulWidget {
  const CadastrarVestuario({super.key});

  @override
  State<CadastrarVestuario> createState() => _CadastrarVestuarioState();
}

class _CadastrarVestuarioState extends State<CadastrarVestuario> {
  TextEditingController titleController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Cadastrar Vestuário',
            style: GoogleFonts.montserrat(
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 16),
                TextFormField(
                  controller: titleController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'O título é obrigatório!';
                    }
                    return null;
                  },
                  decoration: buildInputDecoration('Título'),
                  cursorColor: const Color(0xFF10397B),
                ),
                const SizedBox(height: 16),
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
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: onSave,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE81F7C),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      'Salvar',
                      style: GoogleFonts.montserrat(
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
    );
  }

  InputDecoration buildInputDecoration(String label) {
    return InputDecoration(
      label: Text(label),
      floatingLabelStyle: GoogleFonts.montserrat(
        color: const Color(0xFF10397B),
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
      String title = titleController.text;
      String imageUrl = imageUrlController.text;

      Vestuario vestuario = Vestuario(title: title, imageUrl: imageUrl);
      await VestuarioDao().saveVestuario(vestuario);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Vestuário cadastrado com sucesso!')),
      );
      Navigator.pop(context);
    }
  }
}

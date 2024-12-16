import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled1/bd/vestuario_dao.dart';
import 'package:untitled1/domain/vestuario.dart';

class CadastrarVestuario extends StatefulWidget {
  const CadastrarVestuario({super.key});

  @override
  State<CadastrarVestuario> createState() => _CadastrarVestuarioState();
}

class _CadastrarVestuarioState extends State<CadastrarVestuario> {
  TextEditingController tituloController = TextEditingController();
  TextEditingController urlImageController =
  TextEditingController(); // Corrigido para urlImage

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(),
        body: buildBody(),
      ),
    );
  }

  buildBody() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [
          buildTextFormField(
            controller: tituloController,
            text: 'Título',
          ),
          buildTextFormField(
            controller: urlImageController,
            text: 'URL da Imagem',
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFA1887F),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            onPressed: onPressed,
            child: const Text(
              'Cadastrar Vestuário',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  buildTextFormField({
    required TextEditingController controller,
    required String text,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: controller,
        validator: fieldValidator,
        decoration: buildInputDecoration(text),
        cursorColor: const Color(0xFFA1887F),
      ),
    );
  }

  String? fieldValidator(value) {
    if (value == null || value.isEmpty) {
      return "Este campo não pode ser vazio!";
    } else {
      return null;
    }
  }

  buildAppBar() {
    return AppBar(
      centerTitle: false,
      backgroundColor: const Color(0xFFA1887F),
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      title: const Text(
        'Cadastrar Vestuário',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  buildInputDecoration(String name) {
    return InputDecoration(
      label: Text(name),
      floatingLabelStyle: GoogleFonts.montserrat(
        color: const Color(0xFFA1887F),
        fontWeight: FontWeight.w600,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          width: 2,
          color: Color(0xFFA1887F),
        ),
      ),
    );
  }

  Future<void> onPressed() async {
    String titulo = tituloController.text;
    String urlImage = urlImageController.text;

    if (titulo.isEmpty || urlImage.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, preencha todos os campos.')),
      );
      return;
    }

    Vestuario vestuario = Vestuario(
      id: 0,
      urlImage: urlImage,
      titulo: titulo,
    );

    await VestuarioDao().salvarVestuario(vestuario);
    Navigator.pop(context);
  }
}

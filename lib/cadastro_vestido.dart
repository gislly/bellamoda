import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled1/domain/Catalogodoopcoesvestidos.dart';
import 'bd/vestido_dao.dart';

class RegisterDress extends StatefulWidget {
  const RegisterDress({super.key});

  @override
  State<RegisterDress> createState() => _RegisterDressState();
}

class _RegisterDressState extends State<RegisterDress> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController precoController = TextEditingController();
  TextEditingController urlImagemController = TextEditingController();

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
            controller: nomeController,
            text: 'Nome do Vestido',
          ),
          buildTextFormField(
            controller: precoController,
            text: 'Preço',
          ),
          buildTextFormField(
            controller: urlImagemController,
            text: 'URL da Imagem',
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF3F68F7),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            onPressed: onPressed,
            child: const Text(
              'Cadastrar Vestido',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          )
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
        cursorColor: const Color(0xFF10397B),
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
      backgroundColor: const Color(0xFF10397B),
      iconTheme: const IconThemeData(
        color: Colors.white, // Mudar cor aqui
      ),
      title: const Text(
        'Cadastrar Novo Vestido',
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

  Future<void> onPressed() async {
    String nome = nomeController.text;
    double preco = double.parse(precoController.text);
    String urlImage = urlImagemController.text;

    // Criando um objeto do tipo Catalogodoopcoesvestidos
    Catalogodoopcoesvestidos vestido = Catalogodoopcoesvestidos(
      id: 0, // Define um ID padrão, já que ele será gerado no banco.
      titulo: nome,
      preco: preco,
      urlImage: urlImage,
    );

    // Salvando o vestido usando CatalogoVestidoDao
    await CatalogoVestidosDao().salvarVestido(vestido);
  }
}

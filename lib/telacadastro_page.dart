import 'package:flutter/material.dart';
import 'tela_page.dart';
import 'package:untitled1/domain/user.dart';
import 'package:untitled1/bd/user_dao.dart';


class TelaCadastroPage extends StatefulWidget {
  const TelaCadastroPage({super.key});


  @override
  State<TelaCadastroPage> createState() => _TelaCadastroPageState();
}


class _TelaCadastroPageState extends State<TelaCadastroPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController idadeController = TextEditingController();
  final TextEditingController cepController = TextEditingController();
  final TextEditingController telefoneController = TextEditingController();
  final TextEditingController cpfController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final TextEditingController confirmarSenhaController =
  TextEditingController();


  String? validateSenha(String? value) {
    if (value == null || value.isEmpty) {
      return "A senha é obrigatória!";
    } else if ((value == null || value.length < 6)) {
      return "A senha deve ter pelo menos 6 caracteres!";
    }
    return null;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFEBE9),
      appBar: AppBar(
        backgroundColor: Color(0xFFB6A298),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          children: [
            Text(
              'BELLA MODA',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30),
                  Center(
                    child: Text(
                      'PRIMEIRO ACESSO? CADASTRE-SE',
                      style: TextStyle(
                        color: Colors.brown,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 80,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Insira seus dados:',
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  SizedBox(height: 1),
                  TextFormField(
                    controller: nomeController,
                    decoration: InputDecoration(
                      hintText: 'Ex: João da Silva Leite',
                      hintStyle: TextStyle(color: Colors.grey),
                      labelText: 'Nome',
                      labelStyle:
                      TextStyle(fontSize: 15, color: Color(0xff646161)),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) => value == null || value.isEmpty
                        ? "O nome é obrigatório!"
                        : null,
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: idadeController,
                    decoration: InputDecoration(
                      hintText: 'Ex: 24',
                      hintStyle: TextStyle(color: Colors.grey),
                      labelText: 'Idade',
                      labelStyle:
                      TextStyle(fontSize: 15, color: Color(0xff646161)),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) => value == null || value.isEmpty
                        ? "A idade é obrigatória!"
                        : null,
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: cepController,
                    decoration: InputDecoration(
                      hintText: 'Ex: 95407-323',
                      hintStyle: TextStyle(color: Colors.grey),
                      labelText: 'CEP',
                      labelStyle:
                      TextStyle(fontSize: 15, color: Color(0xff646161)),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) => value == null || value.isEmpty
                        ? "O CEP é obrigatório!"
                        : null,
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: telefoneController,
                    decoration: InputDecoration(
                      hintText: 'Ex: +55 (82) 99608-2336',
                      hintStyle: TextStyle(color: Colors.grey),
                      labelText: 'Telefone',
                      labelStyle:
                      TextStyle(fontSize: 15, color: Color(0xff646161)),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) => value == null || value.isEmpty
                        ? "O telefone é obrigatório!"
                        : null,
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: cpfController,
                    decoration: InputDecoration(
                      hintText: 'Ex: 114783097-95',
                      hintStyle: TextStyle(color: Colors.grey),
                      labelText: 'CPF',
                      labelStyle:
                      TextStyle(fontSize: 15, color: Color(0xff646161)),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) => value == null || value.isEmpty
                        ? "O CPF é obrigatório!"
                        : null,
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: 'Ex: contatobellamoda@gmail.com',
                      hintStyle: TextStyle(color: Colors.grey),
                      labelText: 'Email',
                      labelStyle:
                      TextStyle(fontSize: 15, color: Color(0xff646161)),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) => value == null || value.isEmpty
                        ? "O email é obrigatório!"
                        : null,
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: senhaController,
                    decoration: InputDecoration(
                      hintText: '******',
                      hintStyle: TextStyle(color: Colors.grey),
                      labelText: 'Senha',
                      labelStyle:
                      TextStyle(fontSize: 15, color: Color(0xff646161)),
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                    validator: validateSenha,
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: confirmarSenhaController,
                    decoration: InputDecoration(
                      hintText: '******',
                      hintStyle: TextStyle(color: Colors.grey),
                      labelText: 'Confirmar senha',
                      labelStyle:
                      TextStyle(fontSize: 15, color: Color(0xff646161)),
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value != senhaController.text) {
                        return "As senhas não correspondem!";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 40),
                  Center(
                    child: ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState?.validate() == true) {
                          String senha = senhaController.text;
                          String email = emailController.text;


                          User user = User(email, senha);
                          await UserDao().saveUser(user);


                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => TelaPage()),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF4A2C2A),
                        padding:
                        EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'CADASTRAR',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


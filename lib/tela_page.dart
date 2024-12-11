import 'package:flutter/material.dart';
import 'package:untitled1/telacadastro_page.dart';

import 'esqueceuasenha_page.dart';
import 'home_pageduda.dart';


class TelaPage extends StatefulWidget {
  const TelaPage({super.key});

  @override
  State<TelaPage> createState() => _TelaPageState();
}

class _TelaPageState extends State<TelaPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFE6DA),
      body: Padding(
        padding: EdgeInsets.all(24.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 80),
              Center(
                child: Text(
                  'BELLA MODA',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4A2C2A),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Acesse sua conta',
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFF4A2C2A),
                ),
              ),
              SizedBox(height: 40),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Ex: contatobellamoda@gmail.com',
                  hintStyle: TextStyle(color: Colors.grey),
                  labelText: 'Email',
                  labelStyle: TextStyle(fontSize: 15, color: Color(0xff646161)),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                controller: emailController,
                validator: (value) {
                  if (value == null || value.isEmpty || !value.contains("@")) {
                    return "Você precisa digitar um e-mail válido!";
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  hintText: '******',
                  hintStyle: TextStyle(color: Colors.grey),
                  labelText: 'Senha',
                  labelStyle: TextStyle(fontSize: 15, color: Color(0xff646161)),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
                controller: senhaController,
                obscureText: true,
                validator: (value) {
                  if (value == null || value.length < 6 ||  value.isEmpty) {
                    return "Você precisa digitar uma senha válida!";
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EsqueceuasenhaPage()),
                    );
                  },
                  child: Text(
                    'Esqueceu a senha?',
                    style: TextStyle(color: Color(0xFF4A2C2A)),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    // Validar o Form
                    if (formKey.currentState!.validate()) {
                      String email = emailController.text;
                      String senha = senhaController.text;

                      // Chama a autenticação usando o UserDao
                      bool auth = await UserDao().autenticar(email, senha);

                      if (auth) {
                        // Se a autenticação for bem-sucedida, salva o estado do usuário
                        SharedPrefs().setUser(true);

                        // Navega para a HomePage
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return HomePage();
                            },
                          ),
                        );
                      } else {
                        // Se a autenticação falhar, exibe uma mensagem no console
                        print('Usuário e/ou Senha incorreto(s)!');
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF4A2C2A),
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'ENTRAR',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  'ou',
                  style: TextStyle(
                    color: Color(0xFF4A2C2A),
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TelaCadastroPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF4A2C2A),
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'NÃO TEM UMA CONTA AINDA? CADASTRE-SE',
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 50),
              Center(
                child: Text(
                  'BELLA MODA',
                  style: TextStyle(color: Color(0xFF4A2C2A)),
                ),
              ),
              Center(
                child: Text(
                  'Email: contatobellamoda@gmail.com',
                  style: TextStyle(color: Color(0xFF4A2C2A)),
                ),
              ),
            ],


          ),
        ),
      ),

    );


  }
}

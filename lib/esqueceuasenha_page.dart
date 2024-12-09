import 'package:flutter/material.dart';
import 'tela_page.dart';

class EsqueceuasenhaPage extends StatefulWidget {
  const EsqueceuasenhaPage({super.key});

  @override
  State<EsqueceuasenhaPage> createState() => _EsqueceuasenhaPageState();
}

class _EsqueceuasenhaPageState extends State<EsqueceuasenhaPage> {
  TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? message;

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
                      'ESQUECEU A SENHA? REDEFINA',
                      style: TextStyle(
                        color: Colors.brown,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Insira o seu email para redefinir a senha',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF4A2C2A),
                    ),
                  ),
                  SizedBox(height: 50),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Ex: contatobellamoda@gmail.com',
                      hintStyle: TextStyle(color: Colors.grey),
                      labelText: 'Email',
                      labelStyle:
                          TextStyle(fontSize: 15, color: Color(0xff646161)),
                      border: OutlineInputBorder(),
                    ),
                    controller: emailController,
                    obscureText: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Você precisa digitar um email válido!";
                      } else if (!value.endsWith('@gmail.com')) {
                        return "Insira um email que termina com @gmail.com!";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 8),
                  if (message != null) // Mostra a mensagem se não for nula
                    Text(
                      message!,
                      style: TextStyle(color: Colors.green),
                    ),
                  SizedBox(height: 10),
                  Text(
                    'Um link será enviado para o seu email. Você pode usa-lo para redefinir sua senha',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF4A2C2A),
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState?.validate() == true) {
                          // Lógica para enviar o código para o email aqui

                          // Navegar para a TelaPage se necessário
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
                        'REDEFINIR',
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

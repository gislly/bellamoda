import 'package:untitled1/bd/shared_prefs.dart';
import 'package:untitled1/home_pageduda.dart';
import 'package:untitled1/tela_page.dart';
import 'package:flutter/material.dart';




class SplashPage extends StatefulWidget {
  const SplashPage({super.key});




  @override
  State<SplashPage> createState() => _SplashPageState();
}




class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    checkUserStatus();
  }




  Future<void> checkUserStatus() async {
    bool isAuth = await SharedPrefs().getUser();
    await Future.delayed(const Duration(seconds: 3));




    if (isAuth) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return HomePage();
          },
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return TelaPage();
          },
        ),
      );
    }
  }




  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffFEFCF6),
      child: Image.network(
          'https://i.pinimg.com/originals/ae/3d/cc/ae3dcc19f0696884375165b8e3df1dad.png'),
    );
  }
}



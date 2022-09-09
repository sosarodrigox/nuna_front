import 'package:flutter/material.dart';
import 'package:nuna_app_front/src/login/login_page.dart';
import 'package:nuna_app_front/src/register/register_page.dart';
import 'package:nuna_app_front/src/utils/my_colors.dart';


void main() {
  runApp(const AppNuna());
}

class AppNuna extends StatefulWidget {
  const AppNuna({Key? key}) : super(key: key);

  @override
  State<AppNuna> createState() => _AppNunaState();
}

class _AppNunaState extends State<AppNuna> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nuna App',
      initialRoute: 'login',
      routes: {
        'login': (BuildContext context) => const LoginPage(),
        'register': (BuildContext context) => const RegisterPage(),
      },
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: MyColors.primaryColor,
        ),
      ),
      //Contiene información del tema que queremos establecer, colores, etc,
    );
  }
}

//Quedé en video 004 Diseño de la pnatalla....
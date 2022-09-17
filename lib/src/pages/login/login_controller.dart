import 'package:flutter/material.dart';
import 'package:nuna_app_front/src/models/response_api.dart';
import 'package:nuna_app_front/src/provider/users.provider.dart';
import 'package:nuna_app_front/src/utils/my_snackbar.dart';

class LoginController {
  BuildContext? context;
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  UsersProvider usersProvider = new UsersProvider();

  Future init(BuildContext context) async {
    this.context = context;
    await usersProvider.init(context);
  }

  void goToRegisterPage() {
    Navigator.pushNamed(context!, 'register');
  }

  void login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    ResponseApi? responseApi = await usersProvider.login(email, password);
    print('Respuesta object: ${responseApi}');
    print('Respuesta: ${responseApi!.toJson()}');
    MySnackbar.show(context!, responseApi.message!);
  }
}

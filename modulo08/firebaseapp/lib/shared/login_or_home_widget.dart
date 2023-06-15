import 'package:firebaseapp/page/home_page.dart';
import 'package:firebaseapp/page/login/login_page.dart';
import 'package:firebaseapp/services/usuario_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginOrHomeWidget extends StatelessWidget {
  const LoginOrHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    UsuarioController usuarioController = Get.find<UsuarioController>();
    return Obx(() {
      return FutureBuilder(
        future: usuarioController.tryAutoLogin(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.error != null) {
            print(snapshot.error);
            return Text('Ocorreu um erro');
          } else {
            print(usuarioController.isAuth);
            return usuarioController.isAuth ? HomePage() : LoginPage();
          }
        },
      );
    });
  }
}

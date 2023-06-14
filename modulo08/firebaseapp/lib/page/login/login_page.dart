import 'package:firebaseapp/page/home_page.dart';
import 'package:firebaseapp/page/register/register_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  Get.to(() => HomePage());
                },
                icon: Icon(Icons.login),
                label: Text("Logar"),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  Get.to(() => RegisterPage());
                },
                icon: Icon(Icons.app_registration_rounded),
                label: Text("Cadastrar-se"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

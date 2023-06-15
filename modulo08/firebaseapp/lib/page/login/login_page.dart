import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebaseapp/page/register/register_page.dart';
import 'package:firebaseapp/services/login_controller.dart';
import 'package:firebaseapp/services/password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/custom_text_field.dart';

class LoginPage extends StatelessWidget {
  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  final a = Get.put(PasswordController(), tag: "1");
  final b = Get.put(PasswordController(), tag: "2");

  LoginPage({super.key});

  Future<void> callAsyncFetch() async {
    try {
      await analytics.logEvent(name: "login_screen_page");
      return;
    } on Exception catch (e) {
      print("[ERROR] on use analitics $e");
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    Get.put(PasswordController());
    LoginController loginController = Get.find<LoginController>();

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: const EdgeInsets.all(16),
          alignment: Alignment.center,
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                  child: Text(
                    "Login",
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 20,
                        color: Colors.blue),
                  ),
                ),
                CustomTextField(
                  labelText: "E-mail",
                  hintText: "Informe seu email.",
                  controller: a,
                  textEditingController: email,
                  key: const ValueKey("email"),
                ),
                CustomTextField(
                  isPassword: true,
                  labelText: "Senha",
                  hintText: "Informe sua senha",
                  controller: b,
                  textEditingController: password,
                  key: const ValueKey("password"),
                ),
                ElevatedButton.icon(
                  onPressed: () =>
                      loginController.login(email.text, password.text),
                  icon: Icon(Icons.login),
                  label: Text("Logar"),
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Get.to(() => RegisterPage());
                  },
                  icon: Icon(Icons.app_registration_rounded),
                  label: Text("Cadastrar-se"),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.green.shade400)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

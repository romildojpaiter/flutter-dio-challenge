import 'package:firebaseapp/page/login/login_page.dart';
import 'package:firebaseapp/services/password_controller.dart';
import 'package:firebaseapp/shared/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final a = Get.put(PasswordController(), tag: "1");
  final b = Get.put(PasswordController(), tag: "2");
  final c = Get.put(PasswordController(), tag: "3");
  @override
  Widget build(BuildContext context) {
    Get.put(PasswordController());
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                  child: Text(
                    "Cadastre-se",
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
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
                CustomTextField(
                  isPassword: true,
                  labelText: "Confirme sua senha",
                  hintText: "Informe sua senha novamente",
                  controller: c,
                  textEditingController: confirmPassword,
                  key: const ValueKey("confirmpassword"),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      "Cadastrar",
                      style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(
                  height: 60,
                  child: TextButton(
                    onPressed: () => Get.to(LoginPage()),
                    child: const Text("Voltar"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

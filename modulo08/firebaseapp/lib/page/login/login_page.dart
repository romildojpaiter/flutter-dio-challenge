import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebaseapp/page/home_page.dart';
import 'package:firebaseapp/page/register/register_page.dart';
import 'package:firebaseapp/services/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;
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
    final loginController = Get.find<LoginController>();
    return FutureBuilder<void>(
      future: callAsyncFetch(),
      builder: (context, AsyncSnapshot<void> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
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
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

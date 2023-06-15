import 'package:firebaseapp/page/chat/chat_home.dart';
import 'package:firebaseapp/page/login/login_page.dart';
import 'package:firebaseapp/services/usuario_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerComponent extends StatelessWidget {
  const DrawerComponent({super.key});

  @override
  Widget build(BuildContext context) {
    UsuarioController usuarioController = Get.find<UsuarioController>();
    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                const DrawerHeader(
                  child: Text("header"),
                ),
                ListTile(
                  leading: const Icon(Icons.chat),
                  title: const Text("Chat"),
                  onTap: () {
                    Get.back();
                    Get.to(() => ChatHome());
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.bug_report),
                  title: const Text("Throw Test Exception"),
                  onTap: () => throw Exception(),
                ),
              ],
            ),
          ),
          Container(
            child: Align(
              alignment: FractionalOffset.bottomRight,
              child: Column(
                children: <Widget>[
                  const Divider(),
                  ListTile(
                    onTap: () => usuarioController.logout(),
                    leading: Icon(Icons.logout),
                    title: Text('Sair'),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

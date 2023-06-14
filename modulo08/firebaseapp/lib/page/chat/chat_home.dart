import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:firebaseapp/services/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatHome extends StatelessWidget {
  ChatHome({super.key});

  @override
  Widget build(BuildContext context) {
    ChatController chatx = Get.put(ChatController());
    final remoteConfig = FirebaseRemoteConfig.instance;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Chat"),
        ),
        body: Container(
          color: Color(int.parse("0xff${remoteConfig.getString("COR_FUNDO_TELA")}")),
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                remoteConfig.getString("TEXTO_CHAT_APELIDO"),
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
              ),
              TextField(
                controller: chatx.nickNameController,
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      chatx.closeChatMessages();
                    },
                    child: const Text("Sair"),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      chatx.openChatMessages();
                    },
                    child: const Text("Entrar no chat"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

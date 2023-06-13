import 'package:firebaseapp/page/chat/chat_messages_page.dart';
import 'package:firebaseapp/page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  TextEditingController nickNameController = TextEditingController();

  void openChatMessages() {
    if (nickNameController.text.isEmpty) {
      Get.snackbar(
        "Error",
        "Apelido inválido!",
        animationDuration: const Duration(seconds: 2),
      );
      return;
    }
    Get.to(() => ChatMessagesPage(nickName: nickNameController.text));
  }

  void closeChatMessages() {
    nickNameController.clear();
    Get.to(() => HomePage());
  }
}

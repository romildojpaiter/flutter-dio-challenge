import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebaseapp/models/mensagem_model.dart';
import 'package:firebaseapp/page/home_page.dart';
import 'package:firebaseapp/services/chat_messages_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatMessagesPage extends StatelessWidget {
  final String nickName;
  const ChatMessagesPage({
    Key? key,
    required this.nickName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var chatMessagesX = Get.put(ChatMessagesController());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Get.to(HomePage());
            },
          ),
          title: Text("$nickName : Mensagens"),
        ),
        body: Container(
          child: Column(
            children: [
              Expanded(
                child: Obx(() {
                  return StreamBuilder<QuerySnapshot>(
                      stream: chatMessagesX.mensagens.value,
                      builder: (context, snapshot) {
                        return !snapshot.hasData
                            ? const CircularProgressIndicator()
                            : ListView(
                                children: snapshot.data!.docs.map(
                                  (e) {
                                    var mensagem = MensagemModel.fromJson((e.data() as Map<String, dynamic>));
                                    return Container(
                                      alignment: chatMessagesX.currentUserId == mensagem.userId
                                          ? Alignment.centerRight
                                          : Alignment.centerLeft,
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                        decoration: BoxDecoration(
                                          color: chatMessagesX.currentUserId == mensagem.userId
                                              ? Colors.blue.shade100
                                              : Colors.green.shade100,
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: Text(
                                          mensagem.mensagem,
                                          style: TextStyle(color: Colors.black),
                                          textAlign: chatMessagesX.currentUserId == mensagem.userId
                                              ? TextAlign.right
                                              : TextAlign.left,
                                        ),
                                      ),
                                    );
                                  },
                                ).toList(),
                              );
                      });
                }),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black87),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: chatMessagesX.mensagemController,
                        decoration: InputDecoration(
                          hintText: 'Mensagem',
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          focusedBorder: InputBorder.none,
                          contentPadding: EdgeInsets.all(5),
                        ),
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        chatMessagesX.nickname = nickName;
                        chatMessagesX.incluirMensagem();
                      },
                      icon: Icon(Icons.send),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

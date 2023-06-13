import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebaseapp/models/mensagem_model.dart';
import 'package:firebaseapp/page/home_page.dart';
import 'package:firebaseapp/services/chat_messages_controller.dart';
import 'package:firebaseapp/shared/chat_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

class ChatMessagesPage extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();
  final String nickName;
  final ChatMessagesController chatMessagesX = Get.put(ChatMessagesController());
  ChatMessagesPage({
    Key? key,
    required this.nickName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          margin: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Expanded(
                child: Obx(
                  () {
                    return StreamBuilder<QuerySnapshot>(
                      stream: chatMessagesX.mensagens.value,
                      builder: (context, snapshot) {
                        return !snapshot.hasData
                            ? const Center(child: CircularProgressIndicator())
                            : ListView(
                                controller: _scrollController,
                                children: snapshot.data!.docs.map(
                                  (e) {
                                    var mensagem = MensagemModel.fromJson((e.data() as Map<String, dynamic>));
                                    SchedulerBinding.instance.addPostFrameCallback(
                                      (_) {
                                        _scrollController.animateTo(_scrollController.position.maxScrollExtent + 40,
                                            duration: const Duration(milliseconds: 1), curve: Curves.fastOutSlowIn);
                                      },
                                    );
                                    return ChatWidget(
                                      myMessage: chatMessagesX.currentUserId == mensagem.userId,
                                      mensagemModel: mensagem,
                                    );
                                  },
                                ).toList(),
                              );
                      },
                    );
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black87),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Obx(
                  () => Row(
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
                            contentPadding: const EdgeInsets.all(5),
                          ),
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                          onChanged: (value) {
                            print(value.isBlank);
                            print(value.isEmpty);
                            chatMessagesX.disableSend.value = value.isNotEmpty && !value.isBlank!;
                          },
                        ),
                      ),
                      IconButton(
                        color: Colors.green,
                        disabledColor: Colors.black26,
                        onPressed: !chatMessagesX.disableSend.value
                            ? null
                            : () {
                                chatMessagesX.nickname = nickName;
                                chatMessagesX.incluirMensagem();
                                chatMessagesX.disableSend.value = false;
                              },
                        icon: const Icon(Icons.send),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

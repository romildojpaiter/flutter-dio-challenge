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
    var chatx = Get.put(ChatMessagesController());
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
                child: ListView(),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black87),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration:
                            InputDecoration(focusedBorder: InputBorder.none),
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
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

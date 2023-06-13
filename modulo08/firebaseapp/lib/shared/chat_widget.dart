import 'package:firebaseapp/models/mensagem_model.dart';
import 'package:flutter/material.dart';

class ChatWidget extends StatelessWidget {
  final bool myMessage;
  final MensagemModel mensagemModel;

  const ChatWidget({
    Key? key,
    required this.myMessage,
    required this.mensagemModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: myMessage ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: myMessage ? Colors.blue.shade100 : Colors.green.shade100,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          mensagemModel.mensagem,
          style: const TextStyle(color: Colors.black),
          textAlign: myMessage ? TextAlign.right : TextAlign.left,
        ),
      ),
    );
  }
}

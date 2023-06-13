import 'package:firebaseapp/main.dart';
import 'package:firebaseapp/models/mensagem_model.dart';
import 'package:firebaseapp/repository/message_repository.dart';
import 'package:firebaseapp/services/usuario_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatMessagesController extends GetxController {
  TextEditingController mensagemController = TextEditingController(text: "");
  var mensagemRepository = getIt<MensagemRepository>();
  final RxString _nickName = "".obs;
  final UsuarioController _usuarioController = getIt<UsuarioController>();

  String get nickname => _nickName.value;
  set nickname(String nickname) => _nickName.value = nickname;

  void incluirMensagem() {
    MensagemModel mensagemModel = MensagemModel(
      userId: _usuarioController.userId,
      nickname: _nickName.value,
      mensagem: mensagemController.text,
    );
    // print(mensagemModel.toJson());
    mensagemRepository.add(mensagemModel);
    mensagemController.clear();
  }
}

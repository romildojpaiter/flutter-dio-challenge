import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebaseapp/main.dart';
import 'package:firebaseapp/models/mensagem_model.dart';
import 'package:firebaseapp/repository/message_repository.dart';
import 'package:firebaseapp/services/usuario_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatMessagesController extends GetxController {
  final TextEditingController mensagemController = TextEditingController(text: "");
  final MensagemRepository _mensagemRepository = getIt<MensagemRepository>();
  final RxString _nickName = "".obs;
  final UsuarioController _usuarioController = getIt<UsuarioController>();

  RxBool disableSend = false.obs;

  String get nickname => _nickName.value;
  set nickname(String nickname) => _nickName.value = nickname;

  Future<void> incluirMensagem() async {
    if (mensagemController.value.text.trim().isEmpty) {
      Get.snackbar("Oouuuu", "Informe uma mensagem.");
      return;
    }
    MensagemModel mensagemModel = MensagemModel(
      userId: _usuarioController.userId,
      nickname: _nickName.value,
      mensagem: mensagemController.value.text,
    );
    await _mensagemRepository.add(mensagemModel);
    mensagemController.clear();
  }

  Rx<Stream<QuerySnapshot<Map<String, dynamic>>>> get mensagens =>
      _mensagemRepository.list().orderBy("data_hora", descending: false).snapshots().obs;

  String get currentUserId => _usuarioController.userId;
}

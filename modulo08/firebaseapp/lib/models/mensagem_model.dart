import 'package:cloud_firestore/cloud_firestore.dart';

class MensagemModel {
  DateTime dataHora = DateTime.now();
  String userId = "";
  String nickname = "";
  String mensagem = "";

  MensagemModel({required this.userId, required this.nickname, required this.mensagem});

  MensagemModel.fromJson(Map<String, dynamic> json) {
    dataHora = (json['data_hora'] as Timestamp).toDate();
    userId = json['userId'];
    nickname = json['nickname'];
    mensagem = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data_hora'] = Timestamp.fromDate(dataHora);
    data['userId'] = userId;
    data['nickname'] = nickname;
    data['text'] = mensagem;
    return data;
  }
}

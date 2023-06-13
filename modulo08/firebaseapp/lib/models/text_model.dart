import 'package:cloud_firestore/cloud_firestore.dart';

class TextModel {
  DateTime dataHora = DateTime.now();
  String userId = "";
  String nickname = "";
  String text = "";

  TextModel({required this.userId, required this.nickname, required this.text});

  TextModel.fromJson(Map<String, dynamic> json) {
    dataHora = (json['data_hora'] as Timestamp).toDate();
    userId = json['userId'];
    nickname = json['nickname'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data_hora'] = Timestamp.fromDate(dataHora);
    data['userId'] = userId;
    data['nickname'] = nickname;
    data['text'] = text;
    return data;
  }
}

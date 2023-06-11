import 'package:cloud_firestore/cloud_firestore.dart';

class TarefaModel {
  String? id;
  String descricao = "";
  bool concluido = false;
  DateTime? concludedAt;
  DateTime createdAt = DateTime.now();

  TarefaModel(
      {required this.descricao, required this.concluido, this.concludedAt});

  TarefaModel.of({required this.descricao, required this.concluido});

  TarefaModel.fromJson(Map<String, dynamic> json) {
    descricao = json['descricao'];
    concluido = json['concluido'];
    concludedAt = json['concludedAt'] == null
        ? null
        : (json['concludedAt'] as Timestamp).toDate();
    createdAt = (json["createdAt"] as Timestamp).toDate();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['descricao'] = this.descricao;
    data['concluido'] = this.concluido;
    data['concludedAt'] = this.concludedAt;
    data['createdAt'] = this.createdAt;
    return data;
  }
}

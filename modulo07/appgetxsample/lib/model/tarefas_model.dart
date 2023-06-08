import 'package:flutter/material.dart';

class Tarefa {
  String id = "";
  late String descricao;
  late bool concluido;

  Tarefa({
    required this.descricao,
    required this.concluido,
  }) {
    id = UniqueKey().toString();
  }

  Tarefa.empty() {
    id = "";
    descricao = "";
    concluido = false;
  }
}

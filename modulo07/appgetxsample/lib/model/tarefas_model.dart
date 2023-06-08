import 'package:flutter/material.dart';

class Tarefa {
  String id = "";
  String descricao;
  bool concluido;

  Tarefa({
    required this.descricao,
    required this.concluido,
  }) {
    id = UniqueKey().toString();
  }
}

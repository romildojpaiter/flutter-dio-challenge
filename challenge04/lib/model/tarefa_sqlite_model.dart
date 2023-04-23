import 'package:flutter/widgets.dart';

class TarefaSqliteModel {
  //
  static const String TABLE = "tarefas";

  String _id = "";
  String _descricao = "";
  bool _concluido = false;

  TarefaSqliteModel(this._id, this._descricao, this._concluido);

  TarefaSqliteModel.vazio() {
    _id = UniqueKey().toString();
    _descricao = "";
    _concluido = false;
  }

  String get id => _id;
  set id(String id) => _id = id;

  String get descricao => _descricao;
  set descricao(String descricao) => _descricao = descricao;

  bool get concluido => _concluido;
  set concluido(bool concluido) => _concluido = concluido;

  Map<String, Object> toMap() => {
        // "id": _id,
        "descricao": _descricao,
        "concluido": _concluido,
      };
}

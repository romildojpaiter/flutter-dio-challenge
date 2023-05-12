import 'dart:convert';

import 'package:taskapp/back4app/back4app_dio_custom.dart';
import 'package:taskapp/model/tarefa_model.dart';

class TarefaRepository {
  //
  final String _path = "/tarefas";
  final _customDio = Back4AppDioCustom();

  Future<TarefasModel> get(bool onlyNotCompleted) async {
    var query = _path;
    if (onlyNotCompleted) {
      query += '?where={"concluida":false}';
    }
    var result = await _customDio.dio.get(query);
    return TarefasModel.fromJson(result.data);
  }

  Future<void> criar(TarefaModel tarefaModel) async {
    try {
      var response =
          await _customDio.dio.post(_path, data: tarefaModel.createWithJson());
    } catch (e) {
      throw e;
    }
  }

  Future<void> excluir(String objectId) async {
    try {
      var query = "$_path/$objectId";
      var response = await _customDio.dio.delete(query);
    } catch (e) {
      throw e;
    }
  }

  Future<void> alterar(String objectId, Map<String, dynamic> map) async {
    try {
      print(json.encode(map));
      var query = "$_path/$objectId";
      var response = await _customDio.dio.put(query, data: json.encode(map));
    } catch (e) {
      throw e;
    }
  }
}

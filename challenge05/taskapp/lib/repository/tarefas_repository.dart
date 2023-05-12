import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:taskapp/model/tarefa_model.dart';

class TarefaRepository {
  //
  final Dio _dio = Dio();
  final String _path = "/tarefas";

  TarefaRepository() {
    _dio.options.headers["X-Parse-Application-Id"] =
        "eyifsDvNsVTfSzZf0jgzzi52s9z6PKNYit81PiE2";
    _dio.options.headers["X-Parse-REST-API-Key"] =
        "ybB1f68fo7HuL0PwHyqSvuFlTHa5VZH60irYkjud";
    _dio.options.headers["Content-type"] = "application/json";
    _dio.options.baseUrl = "https://parseapi.back4app.com/classes";
  }

  Future<TarefasModel> get(bool onlyNotCompleted) async {
    var query = _path;
    if (onlyNotCompleted) {
      query += '?where={"concluida":false}';
    }
    print(query);
    var result = await _dio.get(query);
    return TarefasModel.fromJson(result.data);
  }

  Future<void> criar(TarefaModel tarefaModel) async {
    try {
      var response = await _dio.post(_path, data: tarefaModel.createWithJson());
    } catch (e) {
      throw e;
    }
  }

  Future<void> excluir(String objectId) async {
    try {
      var query = "$_path/$objectId";
      var response = await _dio.delete(query);
    } catch (e) {
      throw e;
    }
  }

  Future<void> alterar(String objectId, Map<String, dynamic> map) async {
    try {
      print(json.encode(map));
      var query = "$_path/$objectId";
      var response = await _dio.put(query, data: json.encode(map));
    } catch (e) {
      throw e;
    }
  }
}

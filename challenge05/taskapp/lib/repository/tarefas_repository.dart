import 'package:dio/dio.dart';
import 'package:taskapp/model/tarefa_model.dart';

class TarefaRepository {
  Future<TarefasModel> get(bool onlyNotCompleted) async {
    var dio = Dio();
    dio.options.headers["X-Parse-Application-Id"] =
        "eyifsDvNsVTfSzZf0jgzzi52s9z6PKNYit81PiE2";
    dio.options.headers["X-Parse-REST-API-Key"] =
        "ybB1f68fo7HuL0PwHyqSvuFlTHa5VZH60irYkjud";
    dio.options.headers["Content-type"] = "application/json";
    var query = "https://parseapi.back4app.com/classes/tarefas";
    if (onlyNotCompleted) {
      query += '?where={"concluida":false}';
    }
    var result = await dio.get(query);
    return TarefasModel.fromJson(result.data);
  }
}

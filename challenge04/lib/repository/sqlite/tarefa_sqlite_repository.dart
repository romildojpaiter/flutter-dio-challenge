import 'package:challenge04/model/tarefa_sqlite_model.dart';
import 'package:challenge04/repository/sqlite/sqlite_database.dart';

class TarefaSqliteRepository {
  //

  Future<List<TarefaSqliteModel>> get(notConcluded) async {
    List<TarefaSqliteModel> list = [];
    var db = await SqliteDataBase().getDataBase();
    var result = await db.rawQuery(notConcluded
        ? "SELECT id, descricao, concluido FROM tarefas WHERE concluido = 0"
        : "SELECT id, descricao, concluido FROM tarefas");
    for (var element in result) {
      list.add(TarefaSqliteModel(
        element["id"].toString(),
        element["_descricao"].toString(),
        element["_concluido"] == 1,
      ));
    }

    return list;
  }

  Future<void> save(TarefaSqliteModel tarefa) async {
    var db = await SqliteDataBase().getDataBase();
    await db.insert(TarefaSqliteModel.TABLE, tarefa.toMap());
  }

  Future<void> update(TarefaSqliteModel tarefa) async {
    var db = await SqliteDataBase().getDataBase();
    await db.rawUpdate(
      "UPDATA tarefas SET (descricao=?, concluido=?) WHERE id = ?",
      [tarefa.descricao, tarefa.concluido, tarefa.id],
    );
  }

  Future<void> delete(TarefaSqliteModel tarefa) async {
    var db = await SqliteDataBase().getDataBase();
    await db.rawDelete('DELETE FROM tarefas WHERE id = ?', [tarefa.id]);
  }
}

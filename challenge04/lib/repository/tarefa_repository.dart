import 'package:challenge04/model/tarefa_model.dart';
import 'package:hive/hive.dart';

class TarefaRespository {
  static const String _KEY_TAREFAS = 'TAREFAS';

  static late Box _box;

  TarefaRespository._carregar();

  static Future<TarefaRespository> carregar() async {
    if (Hive.isBoxOpen(_KEY_TAREFAS)) {
      _box = Hive.box(_KEY_TAREFAS);
    } else {
      _box = await Hive.openBox(_KEY_TAREFAS);
    }
    return TarefaRespository._carregar();
  }

  void salvar(TarefaModel tarefaModel) {
    _box.add(tarefaModel);
  }

  List<TarefaModel> obter(bool naoConcluido) {
    if (naoConcluido) {
      return _box.values
          .cast<TarefaModel>()
          .where((element) => !element.concluido)
          .toList();
    }
    return _box.values.cast<TarefaModel>().toList();
  }

  void alterar(TarefaModel tarefaModel) {
    tarefaModel.save();
  }

  void excluir(TarefaModel tarefaModel) {
    tarefaModel.delete();
  }
}

import 'package:appgetxsample/model/tarefas_model.dart';
import 'package:get/get.dart';

class TarefasGetXController extends GetxController {
  final RxList<Tarefa> _tarefas = <Tarefa>[].obs;
  final RxBool _somenteNaoConcluidas = false.obs;

  List<Tarefa> get tarefas => _somenteNaoConcluidas.value
      ? _tarefas.where((p0) => !p0.concluido).toList().obs
      : _tarefas.toList().obs;
  bool get somenteNaoConcluidas => _somenteNaoConcluidas.value;

  setApenasNaoConcluido(bool value) {
    _somenteNaoConcluidas.value = value;
  }

  adicionar(String descricao) {
    _tarefas.add(Tarefa(descricao: descricao, concluido: false));
  }

  excluir(String idTarefa) {
    _tarefas.removeWhere((element) => element.id == idTarefa);
  }

  alterar(String id, String descricao, bool concluido) {
    var tarefa = _tarefas.firstWhere((element) => element.id == id);
    tarefa.descricao = descricao;
    tarefa.concluido = concluido;
    _tarefas.refresh();
  }
}

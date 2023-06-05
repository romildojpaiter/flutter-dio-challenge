import 'package:appmobxsample/domain/tarefa_domain_store.dart';
import 'package:mobx/mobx.dart';

// Include generated file
part 'lista_tarefas_domain_store.g.dart';

// This is the class used by rest of your codebase
class ListaTarefasDomainStore = _ListaTarefasDomainStore
    with _$ListaTarefasDomainStore;

abstract class _ListaTarefasDomainStore with Store {
  //
  final ObservableList<TarefaDomainStore> _tarefas =
      <TarefaDomainStore>[].asObservable();

  @computed
  List<TarefaDomainStore> get tarefas => onlyNotCompleted
      ? _tarefas.where((element) => !element.concluido).toList()
      : _tarefas.toList();

  @observable
  var _onlyNotCompleted = Observable(false);

  bool get onlyNotCompleted => _onlyNotCompleted.value;

  @action
  void adicionar(String descricao) {
    _tarefas.add(TarefaDomainStore(descricao, false));
  }

  @action
  void alterar(String id, String descricao, bool concluido) {
    var tarefa = _tarefas.firstWhere((element) => element.id == id);
    tarefa.alterar(descricao, concluido);
  }

  @action
  void excluir(String id) {
    _tarefas.removeWhere((element) => element.id == id);
  }

  @action
  void filter(bool value) {
    _onlyNotCompleted.value = value;
  }

  @action
  void clear() {
    _tarefas.clear();
  }
}

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

// Include generated file
part 'tarefa_domain_store.g.dart';

// This is the class used by rest of your codebase
class TarefaDomainStore = _TarefaDomainStore with _$TarefaDomainStore;

abstract class _TarefaDomainStore with Store {
  //
  final String id = UniqueKey().toString();
  @observable
  String descricao = "";
  @observable
  bool concluido = false;

  _TarefaDomainStore(this.descricao, this.concluido);

  @action
  void alterar(String descricao, bool concluido) {
    this.descricao = descricao;
    this.concluido = concluido;
  }

  @action
  void alterarConcluir(bool valueDone) {
    concluido = valueDone;
  }
}

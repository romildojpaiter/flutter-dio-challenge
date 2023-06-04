// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lista_tarefas_domain_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ListaTarefasDomainStore on _ListaTarefasDomainStore, Store {
  Computed<List<TarefaDomainStore>>? _$tarefasComputed;

  @override
  List<TarefaDomainStore> get tarefas => (_$tarefasComputed ??=
          Computed<List<TarefaDomainStore>>(() => super.tarefas,
              name: '_ListaTarefasDomainStore.tarefas'))
      .value;

  late final _$_onlyNotCompletedAtom = Atom(
      name: '_ListaTarefasDomainStore._onlyNotCompleted', context: context);

  @override
  Observable<bool> get _onlyNotCompleted {
    _$_onlyNotCompletedAtom.reportRead();
    return super._onlyNotCompleted;
  }

  @override
  set _onlyNotCompleted(Observable<bool> value) {
    _$_onlyNotCompletedAtom.reportWrite(value, super._onlyNotCompleted, () {
      super._onlyNotCompleted = value;
    });
  }

  late final _$_ListaTarefasDomainStoreActionController =
      ActionController(name: '_ListaTarefasDomainStore', context: context);

  @override
  void adicionar(String descricao) {
    final _$actionInfo = _$_ListaTarefasDomainStoreActionController.startAction(
        name: '_ListaTarefasDomainStore.adicionar');
    try {
      return super.adicionar(descricao);
    } finally {
      _$_ListaTarefasDomainStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void alterar(String id, String descricao, bool concluido) {
    final _$actionInfo = _$_ListaTarefasDomainStoreActionController.startAction(
        name: '_ListaTarefasDomainStore.alterar');
    try {
      return super.alterar(id, descricao, concluido);
    } finally {
      _$_ListaTarefasDomainStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void excluir(String id) {
    final _$actionInfo = _$_ListaTarefasDomainStoreActionController.startAction(
        name: '_ListaTarefasDomainStore.excluir');
    try {
      return super.excluir(id);
    } finally {
      _$_ListaTarefasDomainStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void filter(bool value) {
    final _$actionInfo = _$_ListaTarefasDomainStoreActionController.startAction(
        name: '_ListaTarefasDomainStore.filter');
    try {
      return super.filter(value);
    } finally {
      _$_ListaTarefasDomainStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clear() {
    final _$actionInfo = _$_ListaTarefasDomainStoreActionController.startAction(
        name: '_ListaTarefasDomainStore.clear');
    try {
      return super.clear();
    } finally {
      _$_ListaTarefasDomainStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tarefas: ${tarefas}
    ''';
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tarefa_domain_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TarefaDomainStore on _TarefaDomainStore, Store {
  late final _$descricaoAtom =
      Atom(name: '_TarefaDomainStore.descricao', context: context);

  @override
  String get descricao {
    _$descricaoAtom.reportRead();
    return super.descricao;
  }

  @override
  set descricao(String value) {
    _$descricaoAtom.reportWrite(value, super.descricao, () {
      super.descricao = value;
    });
  }

  late final _$concluidoAtom =
      Atom(name: '_TarefaDomainStore.concluido', context: context);

  @override
  bool get concluido {
    _$concluidoAtom.reportRead();
    return super.concluido;
  }

  @override
  set concluido(bool value) {
    _$concluidoAtom.reportWrite(value, super.concluido, () {
      super.concluido = value;
    });
  }

  late final _$_TarefaDomainStoreActionController =
      ActionController(name: '_TarefaDomainStore', context: context);

  @override
  void alterar(String descricao, bool concluido) {
    final _$actionInfo = _$_TarefaDomainStoreActionController.startAction(
        name: '_TarefaDomainStore.alterar');
    try {
      return super.alterar(descricao, concluido);
    } finally {
      _$_TarefaDomainStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void alterarConcluir(bool valueDone) {
    print("Passei por aqui");
    final _$actionInfo = _$_TarefaDomainStoreActionController.startAction(
        name: '_TarefaDomainStore.alterarConcluir');
    try {
      return super.alterarConcluir(valueDone);
    } finally {
      _$_TarefaDomainStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
descricao: ${descricao},
concluido: ${concluido}
    ''';
  }
}

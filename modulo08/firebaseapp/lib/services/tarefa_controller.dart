import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebaseapp/main.dart';
import 'package:firebaseapp/models/tarefa_model.dart';
import 'package:firebaseapp/repository/tarefa_repository.dart';
import 'package:get/get.dart';

class TarefaController extends GetxController {
  var tarefaRepository = getIt<TarefaRepository>();

  final RxBool _somenteNaoConcluidas = false.obs;
  final Rx<TarefaModel> _tarefa =
      TarefaModel(descricao: "", concluido: false).obs;

  TarefaModel get tarefa => _tarefa.value;
  set tarefa(TarefaModel tarefaModel) => _tarefa.value = tarefaModel;

  bool get somenteNaoConcluidas => _somenteNaoConcluidas.value;
  setApenasNaoConcluido(bool value) {
    _somenteNaoConcluidas.value = value;
  }

  Rx<Stream<QuerySnapshot<Map<String, dynamic>>>> get tarefas =>
      _somenteNaoConcluidas.value
          ? consultaWhereAndOrder().obs
          : tarefaRepository
              .list()
              .orderBy("createdAt", descending: true)
              .snapshots()
              .obs;

  Stream<QuerySnapshot<Map<String, dynamic>>> consultaWhereAndOrder() {
    var query = tarefaRepository
        .list()
        .where("concluido", isEqualTo: false)
        .orderBy('createdAt', descending: true);
    query.get();
    // query.get().then((QuerySnapshot querySnapshot) {
    //   querySnapshot.docs.forEach((DocumentSnapshot doc) {
    //     print(doc.id + " => " + doc.data().toString());
    //   });
    // }).catchError((error) {
    //   print("Erro ao executar a consulta: $error");
    // });
    return query.snapshots();
  }

  Future<void> addTask(String descricao) async {
    final tarefa = TarefaModel.of(descricao: descricao, concluido: false);
    return await tarefaRepository.adicionar(tarefa);
  }

  Future<void> alterar(TarefaModel tarefa) async {
    return await tarefaRepository.alterar(tarefa);
  }

  Future<void> excluir(TarefaModel tarefa) async {
    return await tarefaRepository.excluir(tarefa);
  }
}

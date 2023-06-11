import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebaseapp/main.dart';
import 'package:firebaseapp/models/tarefa_model.dart';
import 'package:firebaseapp/repository/tarefa_repository.dart';
import 'package:firebaseapp/services/usuario_controller.dart';
import 'package:get/get.dart';

class TarefaController extends GetxController {
  var tarefaRepository = getIt<TarefaRepository>();
  final UsuarioController _usuarioController = getIt<UsuarioController>();

  final RxBool _somenteNaoConcluidas = false.obs;
  final Rx<TarefaModel> _tarefa = TarefaModel(
    descricao: "",
    concluido: false,
    userId: "",
  ).obs;

  TarefaModel get tarefa => _tarefa.value;
  set tarefa(TarefaModel tarefaModel) => _tarefa.value = tarefaModel;

  bool get somenteNaoConcluidas => _somenteNaoConcluidas.value;
  setApenasNaoConcluido(bool value) {
    _somenteNaoConcluidas.value = value;
  }

  Rx<Stream<QuerySnapshot<Map<String, dynamic>>>> get tarefas =>
      _somenteNaoConcluidas.value
          ? _consultaComFiltro().obs
          : _consultaPrincipal().obs;

  Stream<QuerySnapshot<Map<String, dynamic>>> _consultaPrincipal() {
    var query = tarefaRepository
        .list()
        .where("userId", isEqualTo: _usuarioController.userId)
        .orderBy("createdAt", descending: true);
    query.get();
    // query.get().then((QuerySnapshot querySnapshot) {
    //   print("consultar principal ${querySnapshot.docs.length}");
    //   querySnapshot.docs.forEach((DocumentSnapshot doc) {
    //     print(doc.id + " => " + doc.data().toString());
    //   });
    // }).catchError((error) {
    //   print("Erro ao executar a consulta: $error");
    // });
    return query.snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> _consultaComFiltro() {
    var query = tarefaRepository
        .list()
        .where("userId", isEqualTo: _usuarioController.userId)
        .where("concluido", isEqualTo: false)
        .orderBy('createdAt', descending: true);
    query.get();
    // query.get().then((QuerySnapshot querySnapshot) {
    //   print("consultar com filtro ${querySnapshot.docs.length}");
    //   querySnapshot.docs.forEach((DocumentSnapshot doc) {
    //     print(doc.id + " => " + doc.data().toString());
    //   });
    // }).catchError((error) {
    //   print("Erro ao executar a consulta: $error");
    // });
    return query.snapshots();
  }

  Future<void> addTask(String descricao) async {
    final tarefa = TarefaModel.of(
      descricao: descricao,
      concluido: false,
      userId: _usuarioController.userId,
    );
    print(tarefa);
    return await tarefaRepository.adicionar(tarefa);
  }

  Future<void> alterar(TarefaModel tarefa) async {
    tarefa.userId = _usuarioController.userId;
    return await tarefaRepository.alterar(tarefa);
  }

  Future<void> concluir(TarefaModel tarefa) async {
    tarefa.userId = _usuarioController.userId;
    if (tarefa.concluido) {
      tarefa.concludedAt = DateTime.now();
    } else {
      tarefa.concludedAt = null;
    }
    return await tarefaRepository.alterar(tarefa);
  }

  Future<void> excluir(TarefaModel tarefa) async {
    tarefa.userId = _usuarioController.userId;
    return await tarefaRepository.excluir(tarefa);
  }

  void initTarefaModel() {
    _tarefa.value = TarefaModel(
      descricao: "",
      concluido: false,
      userId: "",
    );
  }
}

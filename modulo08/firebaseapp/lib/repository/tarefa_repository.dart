import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebaseapp/models/tarefa_model.dart';

abstract class TarefaRepository {
  CollectionReference<Map<String, dynamic>> list();

  void add(TarefaModel tarefa);

  Future<void> adicionar(TarefaModel tarefa);

  Future<void> alterar(TarefaModel tarefa);

  Future<void> excluir(TarefaModel tarefa);
}

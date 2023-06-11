import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebaseapp/infraestrutura/firebase_conn.dart';
import 'package:firebaseapp/models/tarefa_model.dart';
import 'package:firebaseapp/repository/tarefa_repository.dart';

class TarefaRespositoryImpl implements TarefaRepository {
  final String _collectionTarefas = "tarefas";
  late FirebaseConn firebaseConn;
  TarefaRespositoryImpl({required this.firebaseConn});

  @override
  CollectionReference<Map<String, dynamic>> list() {
    return firebaseConn.db.collection(_collectionTarefas);
  }

  @override
  void add(TarefaModel tarefa) {
    firebaseConn.db.collection(_collectionTarefas).add(tarefa.toJson()).then(
        (DocumentReference doc) => print('TarefaModel add with ID: ${doc.id}'));
  }

  @override
  Future<void> adicionar(TarefaModel tarefa) async {
    DocumentReference result = await firebaseConn.db
        .collection(_collectionTarefas)
        .add(tarefa.toJson());
    print('TarefaModel addAsync with ID: ${result.id}');
  }

  @override
  Future<void> alterar(TarefaModel tarefa) async {
    return await firebaseConn.db
        .collection(_collectionTarefas)
        .doc(tarefa.id)
        .update(tarefa.toJson());
  }

  @override
  Future<void> excluir(TarefaModel tarefa) async {
    return await firebaseConn.db
        .collection(_collectionTarefas)
        .doc(tarefa.id)
        .delete();
  }
}

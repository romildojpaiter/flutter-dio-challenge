import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebaseapp/infraestrutura/firebase_conn.dart';
import 'package:firebaseapp/repository/tarefa_repository.dart';

class TarefaRespositoryImpl implements TarefaRepository {
  late FirebaseConn firebaseConn;
  TarefaRespositoryImpl({required this.firebaseConn});

  @override
  list() {
    return;
  }

  @override
  void add(Map<String, dynamic> tarefa) {
    firebaseConn.db.collection("tarefas").add(tarefa).then(
        (DocumentReference doc) =>
            print('TarefaModell added with ID: ${doc.id}'));
  }
}

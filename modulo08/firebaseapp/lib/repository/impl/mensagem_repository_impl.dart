import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebaseapp/infraestrutura/firebase_conn.dart';
import 'package:firebaseapp/models/mensagem_model.dart';
import 'package:firebaseapp/repository/message_repository.dart';

class MensagemRepositoryImpl extends MensagemRepository {
  final String _collection = "mensagens";
  late FirebaseConn firebaseConn;
  MensagemRepositoryImpl({
    required this.firebaseConn,
  });

  @override
  void add(MensagemModel mensagemModel) {
    firebaseConn.db
        .collection(_collection)
        .add(mensagemModel.toJson())
        .then((DocumentReference doc) => print('MessageModel add with ID: ${doc.id}'));
  }

  @override
  CollectionReference<Map<String, dynamic>> list() {
    return firebaseConn.db.collection(_collection);
  }
}

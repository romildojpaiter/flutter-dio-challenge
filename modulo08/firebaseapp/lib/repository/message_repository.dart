import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebaseapp/models/mensagem_model.dart';

abstract class MensagemRepository {
  Future<void> add(MensagemModel mensagemModel);

  CollectionReference<Map<String, dynamic>> list();
}

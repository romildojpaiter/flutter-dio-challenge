import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebaseapp/infraestrutura/firebase_conn.dart';

class FirebaseConnInfra implements FirebaseConn {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  FirebaseFirestore get db => _db;
}

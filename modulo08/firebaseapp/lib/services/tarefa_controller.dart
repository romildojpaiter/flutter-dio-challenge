import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebaseapp/main.dart';
import 'package:firebaseapp/models/tarefa_model.dart';
import 'package:firebaseapp/repository/tarefa_repository.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class TarefaController extends GetxController {
  var tarefaRepository = getIt<TarefaRepository>();

  // late Rx<CollectionReference<Map<String, dynamic>>> _tarefas;

  // Future<void> load() async {
  //   try {
  //     _tarefas = tarefaRepository.list().obs;
  //     print(_tarefas.map((data) =>
  //         data?.snapshots().map((event) => print(event.reactive.value))));
  //   } catch (e) {
  //     print("[ERROR] on load Tarefa Controller");
  //   }
  // }

  CollectionReference<Map<String, dynamic>> get tarefas =>
      tarefaRepository.list();

  Future<void> addTask() {
    // Create a new user with a first and last name
    final tarefa = TarefaModel.of(descricao: "descricao 2", concluido: false);

    return tarefaRepository.addAsync(tarefa);

    // Add a new document with a generated ID

    // var users = await db.collection("users").get();
    // for (var doc in users.docs) {
    //   print("${doc.id} => ${doc.data()}");
    // }
  }
}

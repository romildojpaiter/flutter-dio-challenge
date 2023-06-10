import 'package:firebaseapp/main.dart';
import 'package:firebaseapp/models/tarefa_model.dart';
import 'package:firebaseapp/repository/tarefa_repository.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class TarefaController extends GetxController {
  var tarefaRepository = getIt<TarefaRepository>();

  late RxList<TarefaModel> tarefas;

  @override
  void onInit() {
    super.onInit();
    tarefas = tarefaRepository.list().obs;
  }

  addTask() async {
    // Create a new user with a first and last name
    final tarefa = TarefaModel.of(descricao: "descricao", concluido: false);

    tarefaRepository.add(tarefa.toJson());

    // Add a new document with a generated ID

    // var users = await db.collection("users").get();
    // for (var doc in users.docs) {
    //   print("${doc.id} => ${doc.data()}");
    // }
  }
}

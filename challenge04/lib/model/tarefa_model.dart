import 'package:hive/hive.dart';

part 'tarefa_model.g.dart';

@HiveType(typeId: 1)
class TarefaModel extends HiveObject {
  @HiveField(0)
  String id = "";

  @HiveField(1)
  String descricao = "";

  @HiveField(2)
  bool concluido = false;

  TarefaModel();

  TarefaModel.vazio() {
    id = "";
    descricao = "";
    concluido = false;
  }
}

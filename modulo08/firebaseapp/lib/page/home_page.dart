import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebaseapp/models/tarefa_model.dart';
import 'package:firebaseapp/services/tarefa_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  var descricaoController = TextEditingController();
  var tarefaController = TarefaController();

  HomePage({super.key});

  _showBottonSheetAdicionarTarefa(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 200,
          color: Colors.amber,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  leading: Icon(Icons.add),
                  title: Text(
                    'Adicionar Tarefa',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextField(
                  controller: descricaoController,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      icon: Icon(Icons.task),
                      hintText: 'Informe o descricao'),
                ),
                Row(
                  children: [
                    ElevatedButton(
                      child: const Text('Fechar'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Expanded(child: Container()),
                    if (tarefaController.tarefa.id == null)
                      ElevatedButton(
                        child: const Text('Adicionar'),
                        onPressed: () {
                          tarefaController.addTask(descricaoController.text);
                          Navigator.pop(context);
                        },
                      )
                    else
                      ElevatedButton(
                        child: const Text('Alterar'),
                        onPressed: () {
                          tarefaController.tarefa.descricao =
                              descricaoController.text;
                          tarefaController.alterar(tarefaController.tarefa);
                          Navigator.pop(context);
                        },
                      )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Firebase Task App"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    const Expanded(child: Text("Somente não concluídas")),
                    Obx(
                      () {
                        return Switch(
                          value: tarefaController.somenteNaoConcluidas,
                          onChanged: (bool value) {
                            tarefaController.setApenasNaoConcluido(value);
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 10,
                child: Obx(() {
                  return StreamBuilder<QuerySnapshot>(
                    stream: tarefaController.tarefas.value,
                    builder: (context, snapshot) {
                      return !snapshot.hasData
                          ? const Center(child: CircularProgressIndicator())
                          : ListView(
                              children: snapshot.data!.docs.map(
                                (item) {
                                  var tarefa = TarefaModel.fromJson(
                                      item.data() as Map<String, dynamic>);
                                  tarefa.id = item.id;
                                  return Dismissible(
                                    key: UniqueKey(),
                                    onDismissed: (DismissDirection direction) {
                                      if (direction ==
                                          DismissDirection.startToEnd) {
                                        tarefaController.excluir(tarefa);
                                      } else if (direction ==
                                          DismissDirection.endToStart) {
                                        tarefaController.tarefa = tarefa;
                                        descricaoController.text =
                                            tarefa.descricao;
                                        _showBottonSheetAdicionarTarefa(
                                            context);
                                      }
                                    },
                                    child: Card(
                                      elevation: 2,
                                      child: ListTile(
                                        title: Text(tarefa.descricao),
                                        trailing: Switch(
                                          value: tarefa.concluido,
                                          onChanged: (bool value) {
                                            tarefa.concluido = value;
                                            tarefaController.alterar(tarefa);
                                          },
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ).toList(),
                            );
                    },
                  );
                }),
              ),
              Expanded(
                flex: 1,
                child: ElevatedButton(
                  onPressed: () {
                    descricaoController.text = "";
                    tarefaController.tarefa =
                        TarefaModel(descricao: "", concluido: false);
                    _showBottonSheetAdicionarTarefa(context);
                  },
                  child: const Text("Adicionar"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

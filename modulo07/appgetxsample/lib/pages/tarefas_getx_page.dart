import 'package:appgetxsample/main.dart';
import 'package:appgetxsample/model/tarefas_model.dart';
import 'package:appgetxsample/service/tarefas_getx_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

// ignore: must_be_immutable
class TarefasGetXPage extends StatelessWidget {
  bool onlyNotCompleted = false;
  var descricaoTextController = TextEditingController(text: "");
  var listaTarefasController = getIt<TarefasGetXController>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var tarefaSelecionada = Tarefa.empty();
  TarefasGetXPage({super.key});

  void handleClick(BuildContext context, String item) {
    print("Item selecionado $item");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: const Text("Lista de Tarefas"),
          actions: [
            PopupMenuButton<int>(
              // onSelected: (item) => handleClick(context, item),
              itemBuilder: (context) => [
                PopupMenuItem<int>(
                  value: 0,
                  child: const Row(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.plus,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text('Add'),
                    ],
                  ),
                  onTap: () => showBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) =>
                        showContainerFormAddDescricao(context),
                  ),
                ),
              ],
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Lista de Tarefas com GetX",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  const Expanded(
                    child: Text("Somente não completas"),
                  ),
                  Obx(() {
                    return Switch(
                      value: listaTarefasController.somenteNaoConcluidas,
                      onChanged: listaTarefasController.setApenasNaoConcluido,
                    );
                  })
                ],
              ),
              const Divider(),
              Obx(
                () {
                  return listaTarefasController.tarefas.isEmpty
                      ? const Expanded(
                          child: Center(
                            child: Text("Não existem tarefas cadastradas"),
                          ),
                        )
                      : Expanded(
                          child: ListView.builder(
                            itemCount: listaTarefasController.tarefas.length,
                            itemBuilder: (_, index) {
                              var tarefa =
                                  listaTarefasController.tarefas[index];
                              return Dismissible(
                                key: UniqueKey(),
                                child: Card(
                                  child: ListTile(
                                    title: Text(tarefa.descricao),
                                    trailing: Switch(
                                      value: tarefa.concluido,
                                      onChanged: (bool value) =>
                                          listaTarefasController.alterar(
                                              tarefa.id,
                                              tarefa.descricao,
                                              value),
                                    ),
                                  ),
                                ),
                                onDismissed: (DismissDirection direction) {
                                  if (direction ==
                                      DismissDirection.startToEnd) {
                                    listaTarefasController.excluir(tarefa.id);
                                  } else if (direction ==
                                      DismissDirection.endToStart) {
                                    scaffoldKey.currentState!
                                        .showBottomSheet<void>(
                                            (BuildContext context) {
                                      descricaoTextController.text =
                                          tarefa.descricao;
                                      tarefaSelecionada = tarefa;
                                      return showContainerFormAddDescricao(
                                          context);
                                    });
                                  }
                                },
                              );
                            },
                          ),
                        );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Container showContainerFormAddDescricao(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.shade300,
      ),
      margin: const EdgeInsets.all(12.0),
      height: 140,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const Text(
              "Descrição",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: descricaoTextController,
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    descricaoTextController.text = "";
                    Navigator.of(context).pop();
                  },
                  child: const Text("Cancelar"),
                ),
                Expanded(child: Container()),
                ElevatedButton(
                  onPressed: () async {
                    tarefaSelecionada.id.isEmpty
                        ? listaTarefasController
                            .adicionar(descricaoTextController.text)
                        : listaTarefasController.alterar(
                            tarefaSelecionada.id,
                            descricaoTextController.text,
                            tarefaSelecionada.concluido);
                    descricaoTextController.text = "";
                    tarefaSelecionada = Tarefa.empty();
                    Navigator.of(context).pop();
                  },
                  child: tarefaSelecionada.id.isEmpty
                      ? const Text("Salvar")
                      : const Text("Alterar"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

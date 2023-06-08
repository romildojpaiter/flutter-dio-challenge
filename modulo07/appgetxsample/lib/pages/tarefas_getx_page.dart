import 'package:appgetxsample/model/tarefas_model.dart';
import 'package:flutter/material.dart';

class TarefasGetXPage extends StatelessWidget {
  bool onlyNotCompleted = false;
  List<Tarefa> listTarefas = [];
  var decricaoTextController = TextEditingController(text: "");
  TarefasGetXPage({super.key});

  void handleClick(BuildContext context, String item) {
    print("Item selecionado $item");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Lista de Tarefas"),
          actions: [
            PopupMenuButton<String>(
              // onSelected: (item) => handleClick(context, item),
              itemBuilder: (context) => [
                PopupMenuItem<String>(
                  value: "0",
                  child: Text('Add'),
                  onTap: () => showBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) => Container(
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
                            Text(
                              "Descrição",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextField(
                              controller: decricaoTextController,
                            ),
                            Row(
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("Cancelar"),
                                ),
                                Expanded(child: Container()),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("Salvar"),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
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
                  Switch(value: onlyNotCompleted, onChanged: (bool value) {})
                ],
              ),
              const Divider(),
              listTarefas.isEmpty
                  ? const Expanded(
                      child: Center(
                        child: Text("Não existem tarefas cadastradas"),
                      ),
                    )
                  : ListView.builder(
                      itemCount: listTarefas.length,
                      itemBuilder: (_, index) {
                        var tarefa = listTarefas[index];
                        return Card(
                          child: Text("${tarefa.descricao}"),
                        );
                      },
                    )
            ],
          ),
        ),
      ),
    );
  }
}

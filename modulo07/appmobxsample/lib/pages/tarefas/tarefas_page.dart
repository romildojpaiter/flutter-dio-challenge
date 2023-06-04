import 'package:appmobxsample/domain/lista_tarefas_domain_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class TarefasPage extends StatelessWidget {
  var descriptionController = TextEditingController(text: "");
  ListaTarefasDomainStore tarefasStore = ListaTarefasDomainStore();

  TarefasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Tarefas"),
          actions: [
            Observer(
              builder: (_) {
                return IconButton(
                  icon: const Icon(Icons.clear),
                  tooltip: 'Show Snackbar',
                  onPressed: () {
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //     const SnackBar(content: Text('This is a snackbar')));
                    tarefasStore.clear();
                  },
                );
              },
            ),
            Icon(Icons.more_vert),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => showModalBottomSheet<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('Incluir Tarefa'),
              content: Column(
                children: [
                  const Text('Insira a descrição'),
                  TextField(
                    controller: descriptionController,
                  )
                ],
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () async {
                    tarefasStore.adicionar(descriptionController.text);
                    Navigator.pop(context, 'OK');
                    descriptionController.text = "";
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          ),
          backgroundColor: Colors.green,
          child: const Icon(Icons.add),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      "Somente não concluídas",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Observer(builder: (_) {
                    return Switch(
                      value: tarefasStore.onlyNotCompleted,
                      onChanged: (bool value) {
                        tarefasStore.filter(value);
                      },
                    );
                  })
                ],
              ),
            ),
            const Divider(),
            Expanded(
              child: Observer(builder: (_) {
                return tarefasStore.tarefas.length == 0
                    ? const Center(
                        child: Text(
                          "Somente não concluídas",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      )
                    : ListView.builder(
                        itemCount: tarefasStore.tarefas.length,
                        itemBuilder: (_, int index) {
                          var tarefa = tarefasStore.tarefas[index];
                          return Observer(builder: (context) {
                            return Card(
                              margin: const EdgeInsets.all(12.0),
                              elevation: 3,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(tarefa.descricao),
                                    ),
                                    Switch(
                                      value: tarefa.concluido,
                                      onChanged: (bool value) {
                                        tarefa.alterarConcluir(value);
                                      },
                                    )
                                  ],
                                ),
                              ),
                            );
                          });
                        },
                      );
              }),
            )
          ],
        ),
      ),
    );
  }
}

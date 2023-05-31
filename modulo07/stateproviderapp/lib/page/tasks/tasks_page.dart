import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stateprovider/repository/tasks_repository.dart';

class TasksPage extends StatelessWidget {
  var descriptionController = TextEditingController(text: "");

  TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Tarefas"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => showDialog<String>(
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
                    Provider.of<TasksRepository>(context, listen: false).add(
                      Task(description: descriptionController.text),
                    );
                    descriptionController.text = "";
                    Navigator.pop(context, 'OK');
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          ),
          backgroundColor: Colors.green,
          child: const Icon(Icons.navigation),
        ),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
              child: Row(
                children: [
                  const Text(
                    "Apenas não concluídas",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Expanded(child: Container()),
                  Consumer<TasksRepository>(builder: (context, tasksRepository, widget) {
                    return Switch(
                      value: tasksRepository.onlyNotCompleted,
                      onChanged: (bool value) {
                        tasksRepository.onlyNotCompleted = value;
                      },
                    );
                  }),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                child: Consumer<TasksRepository>(builder: (context, tasksRepository, widget) {
                  var tarefas = tasksRepository.tasks;
                  return tasksRepository.loading
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          itemCount: tarefas.length,
                          itemBuilder: (_, int index) {
                            var tarefa = tarefas[index];
                            return Dismissible(
                              key: Key(tarefa.id),
                              onDismissed: (DismissDirection dismissDirection) async {
                                tasksRepository.remove(tarefa.id);
                                tarefas = tasksRepository.tasks;
                              },
                              child: Card(
                                elevation: 3,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Center(child: Text(tarefa.description)),
                                      Expanded(child: Container()),
                                      Switch(
                                        value: tarefa.done,
                                        onChanged: (bool value) async {
                                          tarefa.done = value;
                                          tasksRepository.update(tarefa);
                                          tarefas = tasksRepository.tasks;
                                        },
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

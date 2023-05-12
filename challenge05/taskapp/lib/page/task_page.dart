import 'package:flutter/material.dart';
import 'package:taskapp/model/tarefa_model.dart';
import 'package:taskapp/repository/tarefas_repository.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  final TarefaRepository _tarefaRepository = TarefaRepository();
  TarefasModel _tarefasModel = TarefasModel([]);
  bool _loading = false;
  bool _onlyNotCompleted = false;
  var descriptionController = TextEditingController(text: "");

  @override
  void initState() {
    super.initState();
    carregarTarefas();
  }

  Future<void> carregarTarefas() async {
    setState(() {
      _loading = true;
    });
    _tarefasModel = await _tarefaRepository.get(_onlyNotCompleted);
    setState(() {
      _loading = false;
    });
  }

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
                    Navigator.pop(context, 'OK');
                    await _tarefaRepository.criar(
                      TarefaModel.criar(descriptionController.text, false),
                    );
                    descriptionController.text = "";
                    carregarTarefas();
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
              margin:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
              child: Row(
                children: [
                  const Text(
                    "Apenas não concluídas",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Expanded(child: Container()),
                  Switch(
                    value: _onlyNotCompleted,
                    onChanged: (bool value) {
                      _onlyNotCompleted = value;
                      setState(() {});
                      carregarTarefas();
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                child: _loading
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        itemCount: _tarefasModel.tarefas.length,
                        itemBuilder: (_, int index) {
                          var tarefa = _tarefasModel.tarefas[index];
                          return Card(
                            elevation: 3,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Center(child: Text(tarefa.descricao)),
                                  Expanded(child: Container()),
                                  Switch(
                                    value: tarefa.concluida,
                                    onChanged: (bool value) {
                                      // _onlyNotCompleted = value;
                                      carregarTarefas();
                                      setState(() {});
                                    },
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

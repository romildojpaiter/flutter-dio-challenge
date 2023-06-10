import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebaseapp/services/tarefa_controller.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  var descricaoController = TextEditingController();
  var tarefaController = TarefaController();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Firebase Task App"),
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
                    Switch(value: false, onChanged: (bool value) {}),
                  ],
                ),
              ),
              Expanded(
                flex: 10,
                // child: Text("TEste"),
                child: StreamBuilder<QuerySnapshot>(
                  stream: tarefaController.tarefas.snapshots(),
                  builder: (context, snapshot) {
                    return !snapshot.hasData
                        ? const CircularProgressIndicator()
                        : ListView(
                            children: snapshot.data!.docs.map(
                              (e) {
                                var tarefaMap =
                                    (e.data() as Map<String, dynamic>);
                                return Text(tarefaMap["descricao"]);
                              },
                            ).toList(),
                          );
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: ElevatedButton(
                  onPressed: tarefaController.addTask,
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

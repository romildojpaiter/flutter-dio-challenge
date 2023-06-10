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
          padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
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
                child: ListView.builder(
                  itemCount: 0,
                  itemBuilder: (_, int index) {},
                ),
              ),
              Expanded(
                flex: 1,
                child: ElevatedButton(
                  onPressed: tarefaController.addTask(),
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

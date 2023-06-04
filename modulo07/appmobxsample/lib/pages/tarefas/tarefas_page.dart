import 'package:flutter/material.dart';

class TarefasPage extends StatelessWidget {
  const TarefasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Tarefas"),
        ),
        body: Container(),
      ),
    );
  }
}

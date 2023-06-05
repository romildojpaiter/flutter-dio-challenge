import 'package:appmobxsample/service/contador_mobx_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

// ignore: must_be_immutable
class ContadorMobXPage extends StatelessWidget {
  ContadorMobXPage({super.key});
  ContadorMobXStoreService contadorMobXService = ContadorMobXStoreService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Contador"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Contador MobX",
                style: TextStyle(fontSize: 30.0),
              ),
              Observer(
                builder: (context) {
                  return Text(
                    "${contadorMobXService.contador}",
                    style: const TextStyle(fontSize: 30.0),
                  );
                },
              ),
              TextButton(
                onPressed: () {
                  contadorMobXService.incrementar();
                },
                child: const Text(
                  "Incrementar",
                  style: TextStyle(fontSize: 20.0),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

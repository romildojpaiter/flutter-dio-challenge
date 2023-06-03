import 'package:appmobxsample/service/contador_mobx_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

// ignore: must_be_immutable
class ContadorAnnotedMobXPage extends StatelessWidget {
  ContadorAnnotedMobXPage({super.key});
  ContadorMobXStoreService contadorMobXStoreService =
      ContadorMobXStoreService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Contador (Annoted)"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Contador MobX Annoted",
                style: TextStyle(fontSize: 30.0),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Observer(
                builder: (context) {
                  return Text(
                    "${contadorMobXStoreService.contador}",
                    style: const TextStyle(fontSize: 30.0),
                  );
                },
              ),
              TextButton(
                onPressed: () {
                  contadorMobXStoreService.incrementar();
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

import 'package:appgetxsample/components/drawer_component.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../service/contador_getx_controller.dart';

// ignore: must_be_immutable
class HomeGetXApp extends StatelessWidget {
  HomeGetXApp({super.key});
  var contadorGetXController = ContadorGetXController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Counter"),
        ),
        drawer: DrawerComponent(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "GetX Sample Counter",
                style: TextStyle(fontSize: 24.0),
              ),
              SizedBox(
                height: 20,
              ),
              Obx(() {
                return Text(
                  "${contadorGetXController.contador}",
                  style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
                );
              }),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onLongPress: () {
                  contadorGetXController.zerar();
                },
                onPressed: () {
                  contadorGetXController.incrementar();
                },
                child: Text("Incrementar"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

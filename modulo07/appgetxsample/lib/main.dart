import 'package:appgetxsample/home_getx_sample.dart';
import 'package:appgetxsample/service/contador_getx_controller.dart';
import 'package:appgetxsample/service/tarefas_getx_controller.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void main() {
  setupGetIt();

  runApp(const HomeGetXSample());
}

void setupGetIt() {
  getIt.registerSingleton<TarefasGetXController>(TarefasGetXController());
  getIt.registerSingleton<ContadorGetXController>(ContadorGetXController());
}

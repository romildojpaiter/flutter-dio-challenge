import 'package:mobx/mobx.dart';

class ContadorMobXStoreService {
  late Action incrementar;
  final _contador = Observable(0);

  ContadorMobXStoreService() {
    incrementar = Action(_incrementar);
  }

  int get contador => _contador.value;
  set contador(int newValue) => _contador.value = newValue;

  _incrementar() {
    _contador.value++;
  }
}

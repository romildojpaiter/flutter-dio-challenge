import 'package:mobx/mobx.dart';

// Include generated file
part 'contador_mobx_store_service.g.dart';

// This is the class used by rest of your codebase
class ContadorMobXStoreService = _ContadorMobXStoreService
    with _$ContadorMobXStoreService;

// The store-class
abstract class _ContadorMobXStoreService with Store {
  @observable
  int contador = 0;

  @action
  void incrementar() {
    contador++;
  }
}

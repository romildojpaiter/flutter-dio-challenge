import 'package:firebaseapp/services/login_controller.dart';
import 'package:firebaseapp/services/usuario_controller.dart';
import 'package:get/get.dart';

class FirebaseAppBindingCore extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => UsuarioController());
  }
}

import 'package:firebaseapp/services/login_controller.dart';
import 'package:get/get.dart';

class FirebaseAppBindingCore extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}

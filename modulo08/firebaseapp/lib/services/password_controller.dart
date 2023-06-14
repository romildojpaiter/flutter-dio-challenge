import 'package:get/get.dart';

class PasswordController extends GetxController {
  Rx<bool> isShown = false.obs;
  void toogle() {
    isShown.value = !isShown.value;
  }
}

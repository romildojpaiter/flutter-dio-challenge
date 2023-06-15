import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseapp/page/home_page.dart';
import 'package:get/get.dart';

class PasswordController extends GetxController {
  Rx<bool> isShown = false.obs;
  void toogle() {
    isShown.value = !isShown.value;
  }

  Future<void> createUser(String emailAddress, String password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      print(credential);
      Get.to(() => HomePage());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}

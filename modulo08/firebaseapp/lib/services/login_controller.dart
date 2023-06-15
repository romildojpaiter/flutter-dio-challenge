import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseapp/page/home_page.dart';
import 'package:firebaseapp/services/usuario_controller.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final UsuarioController _usuarioController = Get.find<UsuarioController>();

  Future<void> login(String email, String password) async {
    try {
      UserCredential credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (credential != null) {
        _usuarioController.storeCredential(credential);
        Get.to(() => HomePage());
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }
}

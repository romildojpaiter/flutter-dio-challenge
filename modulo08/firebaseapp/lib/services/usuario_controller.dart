import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseapp/page/home_page.dart';
import 'package:firebaseapp/shared/login_or_home_widget.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class UsuarioController extends GetxController {
  final String _keyUser = 'user_id';
  final String _credentialKey = 'credential';
  final RxString _userId = "".obs;
  final RxBool _auth = false.obs;

  bool get isAuth => _auth.value;

  String get userId {
    if (_userId.value.isEmpty) {
      carregarUsuario().then((value) => _userId.value = value);
    }
    return _userId.value;
  }

  Future<String> carregarUsuario() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString(_keyUser);
    if (userId == null) {
      String userkey = const Uuid().v4();
      await prefs.setString(_keyUser, userkey);
      userId = userkey;
    }
    return userId;
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
        print('A senha fornecida é fraca.');
      } else if (e.code == 'email-already-in-use') {
        print('O e-mail informado já está cadastrado.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> storeCredential(UserCredential credential) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? credentialStored = prefs.getString(_credentialKey);
    if (credentialStored == null) {
      await prefs.setString(_credentialKey, json.encode(credential));
      _auth.value = true;
    }
  }

  Future<void> _removeCredential() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_credentialKey);
  }

  Future<void> logout() async {
    await _removeCredential();
    await FirebaseAuth.instance.signOut();
    Get.to(() => const LoginOrHomeWidget());
  }

  Future<void> tryAutoLogin() async {
    if (isAuth) {
      return Future.value();
    }

    return Future.value();
  }
}

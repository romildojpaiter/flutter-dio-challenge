import 'package:get/state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class UsuarioController extends GetxController {
  final String _keyUser = 'user_id';

  final RxString _userId = "".obs;

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
}

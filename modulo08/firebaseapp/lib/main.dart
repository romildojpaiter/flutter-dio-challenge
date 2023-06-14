import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:firebaseapp/infraestrutura/firebase_conn.dart';
import 'package:firebaseapp/infraestrutura/impl/firebase_conn_infra.dart';
import 'package:firebaseapp/repository/impl/mensagem_repository_impl.dart';
import 'package:firebaseapp/repository/impl/tarefa_respository_impl.dart';
import 'package:firebaseapp/repository/message_repository.dart';
import 'package:firebaseapp/repository/tarefa_repository.dart';
import 'package:firebaseapp/services/usuario_controller.dart';
import 'package:firebaseapp/start_app.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'firebase_options.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<FirebaseConn>(FirebaseConnInfra());
  getIt.registerSingleton<UsuarioController>(UsuarioController());

  // Repositories
  getIt.registerSingleton<TarefaRepository>(TarefaRespositoryImpl(firebaseConn: getIt<FirebaseConn>()));
  getIt.registerSingleton<MensagemRepository>(MensagemRepositoryImpl(firebaseConn: getIt<FirebaseConn>()));

  // Alternatively you could write it if you don't like global variables
  // GetIt.I.registerSingleton<AppModel>(AppModel());
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final remoteConfig = FirebaseRemoteConfig.instance;
  await remoteConfig.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(minutes: 1),
    minimumFetchInterval: const Duration(hours: 1),
  ));
  await remoteConfig.setDefaults(const {
    "example_param_1": 42,
    "example_param_2": 3.14159,
    "example_param_3": true,
    "example_param_4": "Hello, world!",
  });
  // Teste recuperando Remote-Config
  try {
    await remoteConfig.fetchAndActivate();
  } on Exception catch (e) {
    // TODO
    print("[ERROR] Ocorreu um erro no remote-config ${e.toString()}");
  }
  print(remoteConfig.getString("example_param_4"));

  await dotenv.load(fileName: ".env");

  setupGetIt();

  runApp(const StartApp());
}

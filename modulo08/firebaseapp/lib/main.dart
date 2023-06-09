import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
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
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';

import 'firebase_options.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<FirebaseConn>(FirebaseConnInfra());
  getIt.registerSingleton<UsuarioController>(UsuarioController());

  // Repositories
  getIt.registerSingleton<TarefaRepository>(
      TarefaRespositoryImpl(firebaseConn: getIt<FirebaseConn>()));
  getIt.registerSingleton<MensagemRepository>(
      MensagemRepositoryImpl(firebaseConn: getIt<FirebaseConn>()));

  // Alternatively you could write it if you don't like global variables
  // GetIt.I.registerSingleton<AppModel>(AppModel());
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

  await _configFirebase();

  setupGetIt();

  runApp(const StartApp());
}

Future<void> _configFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Crashlitics
  // await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  // // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  // PlatformDispatcher.instance.onError = (error, stack) {
  //   FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
  //   return true;
  // };

  // Messeging
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  final fcmToken = await messaging.getToken();
  if (fcmToken != null) {
    print("fcmToken $fcmToken");
  }

  messaging.onTokenRefresh.listen((fcmToken) {
    // Note: This callback is fired at each app startup and whenever a new
    // token is generated.
    print("Obtendo novamente: fcmToken: $fcmToken");
  }).onError((err) {
    // Error getting token.
  });

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');

    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');
    }
  });

  // Remote Config
  final remoteConfig = FirebaseRemoteConfig.instance;
  await remoteConfig.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(minutes: 1),
    minimumFetchInterval: const Duration(hours: 1),
  ));
  remoteConfig.onConfigUpdated.listen((event) async {
    await remoteConfig.activate();
    // Use the new config values here.
  });
  await remoteConfig.setDefaults(const {
    "example_param_1": 42,
    "example_param_2": 3.14159,
    "example_param_3": true,
    "example_param_4": "Hello, world!",
  });
  // Teste recuperando Remote-Config
  try {
    await remoteConfig.fetchAndActivate();
    print(remoteConfig.getString("example_param_4"));
  } on Exception catch (e) {
    // TODO
    print("[ERROR] Ocorreu um erro no remote-config ${e.toString()}");
  }
}

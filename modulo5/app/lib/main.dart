import 'package:app_modulo_05/page/marvel_page.dart';
import 'package:app_modulo_05/page/posts_page.dart';
import 'package:app_modulo_05/page/consulta_cep_page.dart';
import 'package:app_modulo_05/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  _getRoutes(BuildContext ctx) {
    return {
      AppRoutes.CONSULTA_CEP: (ctx) => const ConsultaCepPage(),
      AppRoutes.POSTS: (ctx) => const PostsPage(),
      AppRoutes.HEROES: (ctx) => const MarvelPage(),
    };
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: _getRoutes(context),
      initialRoute: AppRoutes.CONSULTA_CEP,
    );
  }
}

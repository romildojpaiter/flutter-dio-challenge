import 'package:challenge04/page/homePage.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() {
  // Utilizado para usar o Hive
  WidgetsFlutterBinding.ensureInitialized();
  path_provider.getApplicationDocumentsDirectory();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

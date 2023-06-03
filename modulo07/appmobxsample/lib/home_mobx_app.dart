import 'package:appmobxsample/pages/home_app.dart';
import 'package:flutter/material.dart';

class HomeMobxApp extends StatelessWidget {
  const HomeMobxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Modulo 07 - MobX",
      theme: ThemeData.light(),
      home: const HomeApp(),
    );
  }
}

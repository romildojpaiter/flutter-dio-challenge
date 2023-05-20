import 'package:flutter/material.dart';
import 'package:modulo06app/pages/splash/splash_screen_delay_page.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({super.key});

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Modulo 06',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: SplashScreenDelayPage(),
    );
  }
}

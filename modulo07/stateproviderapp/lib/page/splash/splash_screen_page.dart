import 'package:flutter/material.dart';
import 'package:stateprovider/page/home/home_page.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  openLand() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (builder) => const HomePage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    openLand();
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blue, Colors.white],
              stops: [0.1, 0.6]),
        ),
        child: const Center(
          child: Text("Modulo 07"),
        ),
      ),
    );
  }
}

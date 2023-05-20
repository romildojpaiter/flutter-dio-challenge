import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.blue, Colors.white],
                stops: [0.1, 0.6]),
          ),
          child: Center(
            child: SizedBox(
              width: 250.0,
              child: DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
                child: AnimatedTextKit(
                  animatedTexts: [
                    FadeAnimatedText('do IT!'),
                    FadeAnimatedText('do it RIGHT!!'),
                    FadeAnimatedText('do it RIGHT NOW!!!'),
                  ],
                  onTap: () {
                    print("Tap Event");
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

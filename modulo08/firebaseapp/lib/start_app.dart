import 'package:firebaseapp/infraestrutura/core/firebase_app_binding_core.dart';
import 'package:firebaseapp/shared/login_or_home_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';

class StartApp extends StatelessWidget {
  const StartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _buildTheme(Brightness.light),
      home: const LoginOrHomeWidget(),
      initialBinding: FirebaseAppBindingCore(),
    );
  }
}

ThemeData _buildTheme(brightness) {
  var baseTheme = ThemeData(brightness: brightness);

  return baseTheme.copyWith(
    textTheme: GoogleFonts.latoTextTheme(baseTheme.textTheme).copyWith(
      bodyMedium: GoogleFonts.aBeeZee(
        textStyle: const TextStyle(color: Colors.purple),
      ),
    ),
  );
}

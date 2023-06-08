import 'package:appgetxsample/pages/home_getx_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

class HomeGetXSample extends StatelessWidget {
  const HomeGetXSample({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeGetXApp(),
    );
  }
}

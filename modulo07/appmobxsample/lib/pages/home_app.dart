import 'package:appmobxsample/components/drawer_component.dart';
import 'package:flutter/material.dart';

class HomeApp extends StatelessWidget {
  const HomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("MobX Sample"),
        ),
        drawer: const DrawerComponent(),
        body: Container(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stateprovider/components/drawer/drawer_component.dart';
import 'package:stateprovider/repository/dart_mode_repository.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
          actions: [
            const Center(child: Text("Dark Mode")),
            Consumer<DartModeRepository>(
                builder: (_, darkModeRepository, widget) {
              return Switch(
                  value: darkModeRepository.darkMode,
                  activeColor: Colors.black,
                  onChanged: (bool value) {
                    darkModeRepository.darkMode = !darkModeRepository.darkMode;
                  });
            }),
          ],
        ),
        drawer: const DrawerComponent(),
        body: Container(),
      ),
    );
  }
}

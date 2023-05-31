import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stateprovider/components/drawer/drawer_component.dart';
import 'package:stateprovider/repository/dart_mode_repository.dart';
import 'package:stateprovider/services/contador_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    print("builder");
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
                  },
                );
              },
            ),
          ],
        ),
        drawer: const DrawerComponent(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer<ContadorService>(
                builder: (_, contadorService, widget) {
                  return Text(
                    contadorService.contador.toString(),
                    style: const TextStyle(fontSize: 26),
                  );
                },
              ),
              TextButton(
                onPressed: () => Provider.of<ContadorService>(context, listen: false).incrementar(),
                child: const Text("Incrementar"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

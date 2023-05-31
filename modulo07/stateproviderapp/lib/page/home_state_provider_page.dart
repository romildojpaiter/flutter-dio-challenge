import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stateprovider/page/splash/splash_screen_page.dart';
import 'package:stateprovider/repository/dart_mode_repository.dart';
import 'package:stateprovider/repository/tasks_repository.dart';
import 'package:stateprovider/services/contador_service.dart';

class HomeStateProviderPage extends StatefulWidget {
  const HomeStateProviderPage({super.key});

  @override
  State<HomeStateProviderPage> createState() => _HomeStateProviderPageState();
}

class _HomeStateProviderPageState extends State<HomeStateProviderPage> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DartModeRepository>(create: (_) => DartModeRepository()),
        ChangeNotifierProvider<ContadorService>(create: (_) => ContadorService()),
        ChangeNotifierProvider<TasksRepository>(create: (_) => TasksRepository())
      ],
      child: Consumer<DartModeRepository>(
        builder: (_, darkModeRepository, widget) {
          return MaterialApp(
            title: "Ger. Estado com Provider",
            theme: darkModeRepository.darkMode
                ? ThemeData.dark()
                : ThemeData(
                    primarySwatch: Colors.green,
                  ),
            debugShowCheckedModeBanner: false,
            home: const SplashScreenPage(),
          );
        },
      ),
    );
  }
}

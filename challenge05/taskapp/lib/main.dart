import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:taskapp/page/home_page.dart';

Future<void> main() async {
  await dotenv.load();
  runApp(const HomePage());
}

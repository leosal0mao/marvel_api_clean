import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'app/modules/app_module.dart';
import 'app/modules/app_widget.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  await dotenv.load(fileName: '.env');
  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}

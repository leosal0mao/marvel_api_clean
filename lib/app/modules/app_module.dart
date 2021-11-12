import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'characters/characters_module.dart';
import '../../home_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind(
          (i) => Dio(
            BaseOptions(baseUrl: 'https://gateway.marvel.com/v1/public/'),
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        // ChildRoute('/', child: (context, args) => const HomePage()),
        ModuleRoute('/', module: CharacterModule()),
      ];
}

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_api/app/core/helpers/configs/configs.dart';
import 'package:marvel_api/app/core/helpers/endpoints/endpoints.dart';
import 'characters/characters_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind(
          (i) => Dio(
            BaseOptions(
                baseUrl: Endpoints.baseUrl,
                queryParameters: Config.queryParameters),
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: CharacterModule()),
      ];
}

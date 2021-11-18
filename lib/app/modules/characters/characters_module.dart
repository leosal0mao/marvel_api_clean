import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_api/app/modules/characters/submodules/character_details/character_details_module.dart';

import 'package:marvel_api/home_page.dart';

import '../../core/http/http_adapter_impl.dart';
import 'domain/usecases/implementations/usecases_impl.dart';
import 'external/datasources/character_remote_datasource_impl.dart';
import 'infra/repositories/characters_repository_impl.dart';
import 'presenter/character/bloc/character_bloc_bloc.dart';

class CharacterModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => HttpAdapterImpl(dio: i.get())),
        Bind((i) => CharacterRemoteDatasourceImpl(client: i.get())),
        Bind((i) => CharacterRepositoryImpl(datasource: i.get())),
        Bind((i) => FetchCharactersUsecaseImpl(repository: i.get())),
        Bind((i) => CharacterBlocBloc(usecase: i.get())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const HomePage()),
        ModuleRoute('/details', module: CharacterDetailsModule()),
      ];
}

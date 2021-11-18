import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_api/app/modules/characters/submodules/character_details/presenter/character_details_view.dart';

class CharacterDetailsModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (context, args) =>
                CharacterDetailsView(characterDetails: args.data)),
      ];
}

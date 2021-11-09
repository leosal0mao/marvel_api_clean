import 'package:flutter_modular/flutter_modular.dart';
import '../../core/http/http_adapter_impl.dart';

import 'presenter/presenter.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => HttpAdapterImpl(dio: i.get(), url: '')),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const CharacterPage()),
      ];
}

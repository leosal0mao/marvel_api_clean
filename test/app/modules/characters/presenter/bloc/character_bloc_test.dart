
import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_api/app/core/helpers/errors/datasource_error.dart';
import 'package:marvel_api/app/modules/characters/domain/entities/response_characters.dart';
import 'package:marvel_api/app/modules/characters/presenter/character/bloc/character_bloc_bloc.dart';
import 'package:bloc_test/bloc_test.dart';

import '../../mock.dart';

main() {
  late FetchCharactersUsecaseMock usecase;
  late FetchCharacterListEvent fetchEvent;
  late PaginateCharactersEvent paginateEvent;
  late CharactersDtoFake params;
  late ResponseCharacter response;
  late DatasourceError datasourceError;

  setUpAll(() {
    usecase = FetchCharactersUsecaseMock();
    params = CharactersDtoFake();
    fetchEvent = FetchCharacterListEvent(params: params);
    paginateEvent = PaginateCharactersEvent(params: params);
    response = ResponseCharacterFake();
    datasourceError =
        DatasourceError(message: 'erro', stackTrace: StackTrace.current);
  });

  group('Teste do evento FetchCharacters', (){
    blocTest<CharacterBlocBloc, CharacterBlocState>(
      'teste de sucesso',
      build: () => CharacterBlocBloc(usecase: usecase),
      act: (bloc) async {
        when(() => usecase.call(params: params)).thenAnswer((invocation) async => Right(response));
        bloc.add(fetchEvent);
      },
      expect: () => const <CharacterBlocState>[MyState],
  e  );  });
}

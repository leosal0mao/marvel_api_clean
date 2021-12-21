import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_api/app/core/helpers/errors/datasource_error.dart';
import 'package:marvel_api/app/modules/characters/domain/entities/data.dart';
import 'package:marvel_api/app/modules/characters/domain/entities/response_characters.dart';
import 'package:marvel_api/app/modules/characters/presenter/character/bloc/character_bloc_bloc.dart';

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

  group('Teste do evento FetchCharacters', () {
    blocTest<CharacterBlocBloc, CharacterBlocState>(
      'teste de sucesso',
      build: () => CharacterBlocBloc(usecase: usecase),
      act: (bloc) async {
        when(() => usecase.call(params: params))
            .thenAnswer((invocation) async => Right(response));
        bloc.add(fetchEvent);
      },
      expect: () => [
        isA<CharacterBlocStateLoading>(),
        isA<CharacterBlocStateSucess>(),
      ],
    );

    blocTest<CharacterBlocBloc, CharacterBlocState>(
      'teste de falha',
      build: () => CharacterBlocBloc(usecase: usecase),
      act: (bloc) async {
        when(() => usecase.call(params: params))
            .thenAnswer((invocation) async => Left(datasourceError));
        bloc.add(paginateEvent);
      },
      expect: () => [
        isA<CharacterBlocStateLoading>(),
        isA<CharacterBlocStateFailure>(),
      ],
    );
  });

  group('Testes de paginação', () {
    blocTest<CharacterBlocBloc, CharacterBlocState>(
      'teste de sucesso',
      build: () => CharacterBlocBloc(usecase: usecase),
      act: (bloc) async {
        when(() => usecase.call(params: params))
            .thenAnswer((invocation) async => Right(response));
        bloc.add(fetchEvent);
        bloc.add(paginateEvent);
      },
      expect: () => [
        isA<CharacterBlocStateLoading>(),
        isA<CharacterBlocStateSucess>(),
        isA<CharacterBlocStateSucess>(),
      ],
    );

    blocTest<CharacterBlocBloc, CharacterBlocState>(
      'teste de falha',
      build: () => CharacterBlocBloc(usecase: usecase),
      act: (bloc) async {
        when(() => usecase.call(params: params))
            .thenAnswer((invocation) async => Left(datasourceError));
        bloc.add(paginateEvent);
      },
      seed: () => CharacterBlocStateSucess(
          responseData: const ResponseCharacter(
              data: Data(
                offset: 10,
                limit: 10,
                total: 10,
                count: 10,
                characters: [],
              ),
              code: 200,
              status: '200')),
      expect: () => [
        isA<CharacterBlocStateSucess>(),
        isA<CharacterBlocStateFailure>(),
      ],
    );
  });
}

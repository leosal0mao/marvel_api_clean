import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_api/app/core/helpers/errors/failure.dart';
import 'package:marvel_api/app/modules/characters/domain/dtos/dtos.dart';
import 'package:marvel_api/app/modules/characters/domain/entities/entities.dart';
import 'package:marvel_api/app/modules/characters/domain/value_objects/limit.dart';
import 'package:marvel_api/app/modules/characters/infra/repositories/characters_repository_impl.dart';

import '../../mock.dart';

main() {
  late CharacterRepositoryImpl repository;
  late ResponseCharacter response;
  late CharactersDto params;
  late CharacterRemoteDatasourceMock datasource;

  setUpAll(() {
    datasource = CharacterRemoteDatasourceMock();
    repository = CharacterRepositoryImpl(datasource: datasource);
    response = ResponseCharacterFake();
    params = const CharactersDto(limit: Limit(value: 10), offset: 10);
  });

  test('Deve retornar um caso de sucesso', () async {
    when(() => datasource.getAll(params: params.toMap()))
        .thenAnswer((invocation) async => response);

    final result = await repository.fetchCharacters(params: params);

    expect(result.isRight(), true);
    expect(result.fold(id, id), response);

    verify(() => datasource.getAll(params: params.toMap())).called(1);
  });

  test('Deve retornar um caso de falha', () async {
    when(() => datasource.getAll(params: params.toMap()))
        .thenThrow(FailureMock());

    final result = await repository.fetchCharacters(params: params);

    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<Failure>());

    verify(() => datasource.getAll(params: params.toMap())).called(1);
  });
}

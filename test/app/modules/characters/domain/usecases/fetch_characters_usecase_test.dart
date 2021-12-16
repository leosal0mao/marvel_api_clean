import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_api/app/modules/characters/domain/value_objects/limit.dart';
import 'package:mocktail/mocktail.dart';

import 'package:marvel_api/app/core/helpers/errors/failure.dart';
import 'package:marvel_api/app/modules/characters/domain/dtos/dtos.dart';
import 'package:marvel_api/app/modules/characters/domain/entities/entities.dart';
import 'package:marvel_api/app/modules/characters/domain/usecases/implementations/usecases_impl.dart';
import '../../mock.dart';

void main() {
  late CharacterRepositoryMock repository;
  late FetchCharactersUsecaseImpl usecase;
  late ResponseCharacter response;
  late CharactersDto params;
  late CharactersDto paramsError;

  setUpAll(() {
    repository = CharacterRepositoryMock();
    usecase = FetchCharactersUsecaseImpl(repository: repository);
    response = ResponseCharacterFake();
    params = const CharactersDto(limit: Limit(value: 10), offset: 10);
    paramsError = const CharactersDto(limit: Limit(value: 200), offset: 10);
  });

  test('Limit should fail', () async {
    final result = await usecase.call(params: paramsError);

    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<Failure>());

    verifyNever(() => repository.fetchCharacters(params: paramsError))
        .called(0);
  });

  test('Should return CharacterResponse', () async {
    when(() => repository.fetchCharacters(params: params))
        .thenAnswer((invocation) async => Right(response));

    final result = await usecase.call(params: params);

    expect(result.isRight(), true);
    expect(result.fold(id, id), response);

    verify(() => repository.fetchCharacters(params: params)).called(1);
  });

  test('CharacterResponse should fail', () async {
    when(() => repository.fetchCharacters(params: params))
        .thenAnswer((invocation) async => Left(FailureMock()));

    final result = await usecase.call(params: params);

    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<Failure>());

    verify(() => repository.fetchCharacters(params: params)).called(1);
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_api/app/core/helpers/errors/failure.dart';
import 'package:marvel_api/app/modules/characters/domain/dtos/dtos.dart';
import 'package:marvel_api/app/modules/characters/domain/entities/entities.dart';
import 'package:marvel_api/app/modules/characters/domain/repositories/repositories.dart';
import 'package:marvel_api/app/modules/characters/infra/datasources/characters_remote_datasource.dart';
import 'package:mocktail/mocktail.dart';

export 'package:dartz/dartz.dart';
export 'package:faker/faker.dart';
export 'package:mocktail/mocktail.dart';

class CharacterRepositoryMock extends Mock implements CharacterRepository {}

class CharactersDtoFake extends Fake implements CharactersDto {}

class ResponseCharacterFake extends Fake implements ResponseCharacter {}

class CharacterRemoteDatasourceMock extends Mock
    implements CharactersRemoteDatasource {}

class FailureMock extends Mock implements Failure {}

TypeMatcher<Failure> isFail = isA<Failure>();

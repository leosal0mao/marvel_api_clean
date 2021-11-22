import 'package:dartz/dartz.dart';

import '../../../../core/helpers/errors/failure.dart';
import '../../domain/dtos/dtos.dart';
import '../../domain/entities/entities.dart';
import '../../domain/repositories/repositories.dart';
import '../datasources/characters_remote_datasource.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final CharactersRemoteDatasource datasource;

  CharacterRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, ResponseCharacter>> fetchCharacters(
      {required CharactersDto params}) async {
    try {
      final response = await datasource.getAll(params: params.toMap());
      return Right(response);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}

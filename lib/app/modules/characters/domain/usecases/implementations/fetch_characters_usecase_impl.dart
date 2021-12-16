import 'package:dartz/dartz.dart';
import 'package:marvel_api/app/core/domain/usecase/usecase.dart';
import '../../repositories/repositories.dart';

import '../../../../../core/helpers/errors/failure.dart';
import '../../dtos/dtos.dart';
import '../../entities/entities.dart';
import '../interfaces/usecases.dart';

class FetchCharactersUsecaseImpl extends Usecase
    implements FetchCharactersUsecase {
  final CharacterRepository repository;

  FetchCharactersUsecaseImpl({required this.repository});
  @override
  Future<Either<Failure, ResponseCharacter>> call(
      {required CharactersDto params}) async {
    if (hasError(params.limit)) {
      return Left(getError(params.limit));
    }
    final result = await repository.fetchCharacters(params: params);
    return result;
  }
}

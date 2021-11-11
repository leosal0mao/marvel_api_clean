import 'package:dartz/dartz.dart';
import 'package:marvel_api/app/core/helpers/errors/domain_error.dart';
import '../../repositories/repositories.dart';

import '../../../../../core/helpers/errors/failure.dart';
import '../../dtos/dtos.dart';
import '../../entities/entities.dart';
import '../interfaces/usecases.dart';

class FetchCharactersUsecaseImpl extends FetchCharactersUsecase {
  final CharacterRepository repository;

  FetchCharactersUsecaseImpl({required this.repository});
  @override
  Future<Either<Failure, Characters>> call({required CharactersDto params}) {
    if (!params.limit.isValid()) {
      return Future.value(Left(DomainError(
          message: params.limit.errorMessage, stackTrace: StackTrace.current)));
    }
    return repository.fetchCharacters(params: params);
  }
}

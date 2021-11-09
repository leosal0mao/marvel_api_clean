import 'package:dartz/dartz.dart';
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
    return repository.fetchCharacters(params: params);
  }
}

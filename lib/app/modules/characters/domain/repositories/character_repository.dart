import 'package:dartz/dartz.dart';

import '../../../../core/helpers/errors/failure.dart';
import '../dtos/dtos.dart';
import '../entities/entities.dart';

abstract class CharacterRepository {
  Future<Either<Failure, ResponseCharacters>> fetchCharacters(
      {required CharactersDto params});
}

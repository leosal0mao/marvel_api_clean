import 'package:dartz/dartz.dart';
import '../../../../../core/helpers/errors/failure.dart';
import '../../dtos/dtos.dart';
import '../../entities/entities.dart';

abstract class FetchCharactersUsecase {
  Future<Either<Failure, ResponseCharacters>> call(
      {required CharactersDto params});
}

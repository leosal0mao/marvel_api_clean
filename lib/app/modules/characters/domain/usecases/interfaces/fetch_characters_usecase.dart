import 'package:dartz/dartz.dart';
import 'package:marvel_api/app/core/helpers/errors/failure.dart';
import '../../dtos/dtos.dart';
import '../../entities/entities.dart';

abstract class FetchCharactersUsecase {
  Future<Either<Failure, Characters>> call({required CharactersDto params});
}

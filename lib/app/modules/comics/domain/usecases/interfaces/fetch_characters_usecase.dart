import 'package:dartz/dartz.dart';
import 'package:marvel_api/app/core/helpers/errors/failure.dart';
import 'package:marvel_api/app/modules/comics/domain/dtos/dtos.dart';
import 'package:marvel_api/app/modules/comics/domain/entities/entities.dart';

abstract class FetchCharactersUsecase {
  Future<Either<Failure, Characters>> call({required CharactersDto params});
}

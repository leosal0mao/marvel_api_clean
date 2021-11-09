import '../../domain/entities/entities.dart';

abstract class CharactersRemoteDatasource {
  Future<Characters> getAll({required Map<String, dynamic> params});
}

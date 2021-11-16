import '../../domain/entities/entities.dart';

abstract class CharactersRemoteDatasource {
  Future<ResponseCharacters> getAll({required Map<String, dynamic> params});
}

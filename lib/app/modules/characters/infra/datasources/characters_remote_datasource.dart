import '../../domain/entities/entities.dart';

abstract class CharactersRemoteDatasource {
  Future<ResponseCharacter> getAll({required Map<String, dynamic> params});
}

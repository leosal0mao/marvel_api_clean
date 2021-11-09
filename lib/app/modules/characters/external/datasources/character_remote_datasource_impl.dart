import '../../../../core/helpers/errors/datasource_error.dart';
import '../../../../core/helpers/errors/failure.dart';
import '../../../../core/http/http_adapter.dart';
import '../../domain/entities/characters.dart';
import '../../infra/datasources/characters_remote_datasource.dart';
import '../mappers/characters_mapper.dart';

class CharacterRemoteDatasourceImpl implements CharactersRemoteDatasource {
  final HttpAdapter client;

  CharacterRemoteDatasourceImpl({required this.client});
  @override
  Future<Characters> getAll({required Map<String, dynamic> params}) async {
    try {
      final response = await client.get(queries: params);
      final data = response.data;
      return CharactersMapper.fromMap(data);
    } on Failure {
      rethrow;
    } catch (e, stack) {
      throw DatasourceError(message: e.toString(), stackTrace: stack);
    }
  }
}

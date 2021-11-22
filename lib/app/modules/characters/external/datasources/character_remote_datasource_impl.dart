import 'package:marvel_api/app/core/helpers/endpoints/endpoints.dart';
import 'package:dio/dio.dart' hide HttpClientAdapter;
import 'package:marvel_api/app/core/http/errors/http_error.dart';
import '../../../../core/helpers/errors/datasource_error.dart';
import '../../../../core/helpers/errors/failure.dart';
import '../../../../core/http/http_adapter.dart';
import '../../domain/entities/response_characters.dart';
import '../../infra/datasources/characters_remote_datasource.dart';
import '../mappers/response_mapper.dart';

class CharacterRemoteDatasourceImpl implements CharactersRemoteDatasource {
  final HttpAdapter client;

  CharacterRemoteDatasourceImpl({required this.client});
  @override
  Future<ResponseCharacter> getAll(
      {required Map<String, dynamic> params}) async {
    try {
      final response = await client.get(
        url: Endpoints.characters,
        queries: params,
      );
      final data = response.data ?? [];
      return ResponseMapper.fromMap(data);
    } on Failure {
      rethrow;
    } on DioError catch (e) {
      throw HttpError(
        message: e.message,
        stackTrace: e.stackTrace ?? StackTrace.current,
        statusCode: e.response?.statusCode.toString() ?? '400',
      );
    } catch (e, stack) {
      throw DatasourceError(
        message: e.toString(),
        stackTrace: stack,
      );
    }
  }
}

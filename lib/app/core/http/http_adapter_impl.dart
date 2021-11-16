import 'package:dio/dio.dart';
import 'package:marvel_api/app/core/http/response_data.dart';

import 'errors/http_error.dart';
import 'http_adapter.dart';

class HttpAdapterImpl implements HttpAdapter {
  final Dio dio;

  HttpAdapterImpl({required this.dio});

  @override
  Future<ResponseData> get(
      {required Map<String, dynamic>? queries, required String url}) async {
    try {
      final response = await dio.get(url, queryParameters: queries);

      return ResponseData(response.statusCode.toString(), response.data);
    } on DioError catch (e, stack) {
      throw HttpError(
        statusCode: e.response!.statusCode.toString(),
        message: e.response!.data['message'],
        stackTrace: stack,
      );
    }
  }
}

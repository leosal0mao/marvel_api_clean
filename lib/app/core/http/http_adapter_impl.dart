import 'package:dio/dio.dart';

import 'errors/http_error.dart';
import 'http_adapter.dart';

class HttpAdapterImpl implements HttpAdapter {
  final String url;
  final Dio dio;

  HttpAdapterImpl({required this.url, required this.dio});

  @override
  Future<ResponseData> get({Map<String, dynamic>? queries}) async {
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

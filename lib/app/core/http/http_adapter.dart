import 'package:marvel_api/app/core/http/response_data.dart';

abstract class HttpAdapter {
  Future<ResponseData> get({
    required Map<String, dynamic> queries,
    required String url,
  });
}

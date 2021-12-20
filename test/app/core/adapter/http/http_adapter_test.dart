import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_api/app/core/http/errors/http_error.dart';
import 'package:marvel_api/app/core/http/http_adapter_impl.dart';
import 'package:marvel_api/app/core/http/response_data.dart';
import 'package:mocktail/mocktail.dart';

import '../../../modules/characters/mock.dart';

class DioMock extends Mock implements Dio {}

class HttpErrorMock extends Mock implements HttpError {}

class RequestOptionsMock extends Mock implements RequestOptions {}

main() {
  late DioMock dio;
  late HttpErrorMock httpError;
  late HttpAdapterImpl http;
  late String endpoint;
  late Map<String, dynamic> queries;
  late RequestOptionsMock requestOptions;

  setUpAll(() {
    dio = DioMock();
    http = HttpAdapterImpl(dio: dio);
    endpoint = faker.internet.httpUrl();
    queries = {};
    requestOptions = RequestOptionsMock();
  });

  test('Teste status code 200', () async {
    when(() => dio.get(endpoint, queryParameters: queries)).thenAnswer(
      (invocation) async => Response(
        data: [],
        statusCode: 200,
        requestOptions: requestOptions,
      ),
    );

    final result = await http.get(queries: queries, url: endpoint);

    expect(result, isA<ResponseData>());

    verify(() => dio.get(endpoint, queryParameters: queries)).called(1);
  });

  test("teste status 204", () async {
    when(() => dio.get(
          endpoint,
          queryParameters: queries,
        )).thenAnswer(
      (invocation) async => Response(
        data: [],
        statusCode: 204,
        requestOptions: requestOptions,
      ),
    );

    final result = await http.get(queries: queries, url: endpoint);

    expect(result, isA<ResponseData>());

    verify(() => dio.get(endpoint, queryParameters: queries)).called(1);
  });

  test("teste erro status 500", () async {
    when(() => dio.get(
          endpoint,
          queryParameters: queries,
        )).thenAnswer(
      (invocation) async => Response(
        data: [],
        statusCode: 500,
        requestOptions: requestOptions,
      ),
    );

    expect(
        () async => await http.get(
              queries: queries,
              url: endpoint,
            ),
        throwsA(isA<HttpError>()));

    verify(() => dio.get(endpoint, queryParameters: queries)).called(1);
  });

  test("teste erro dio error", () async {
    when(() => dio.get(
          endpoint,
          queryParameters: queries,
        )).thenThrow(HttpErrorMock());

    expect(
        () async => await http.get(
              queries: queries,
              url: endpoint,
            ),
        throwsA(isA<HttpError>()));

    verify(() => dio.get(endpoint, queryParameters: queries)).called(1);
  });

  test("teste erro generico dio error", () async {
    when(() => dio.get(
          endpoint,
          queryParameters: queries,
        )).thenThrow(Exception());

    expect(
        () async => await http.get(
              queries: queries,
              url: endpoint,
            ),
        throwsA(isA<HttpError>()));

    verify(() => dio.get(endpoint, queryParameters: queries)).called(1);
  });
}

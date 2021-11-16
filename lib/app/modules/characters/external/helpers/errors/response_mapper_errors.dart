import 'package:marvel_api/app/core/helpers/errors/failure.dart';

class ResponseMapperErrors extends Failure {
  ResponseMapperErrors(String message, StackTrace stackTrace)
      : super(message, stackTrace);
}

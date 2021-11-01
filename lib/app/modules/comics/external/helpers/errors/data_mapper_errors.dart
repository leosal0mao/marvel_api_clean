import 'package:marvel_api/app/core/helpers/errors/failure.dart';

class DataMapperErrors extends Failure {
  DataMapperErrors(String message, StackTrace stackTrace)
      : super(message, stackTrace);
}

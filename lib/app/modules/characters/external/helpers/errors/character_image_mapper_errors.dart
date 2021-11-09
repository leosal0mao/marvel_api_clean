import 'package:marvel_api/app/core/helpers/errors/failure.dart';

class CharacterImageMapperErrors extends Failure {
  CharacterImageMapperErrors(String message, StackTrace stackTrace)
      : super(message, stackTrace);
}

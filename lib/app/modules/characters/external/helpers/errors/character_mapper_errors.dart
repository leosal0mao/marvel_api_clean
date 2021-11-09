import 'package:marvel_api/app/core/helpers/errors/failure.dart';

class CharacterMapperErrors extends Failure {
  CharacterMapperErrors(String message, StackTrace stackTrace)
      : super(message, stackTrace);
}

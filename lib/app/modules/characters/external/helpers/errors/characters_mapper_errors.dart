import 'package:marvel_api/app/core/helpers/errors/failure.dart';

class CharactersMapperErrors extends Failure {
  CharactersMapperErrors(String message, StackTrace stackTrace)
      : super(message, stackTrace);
}

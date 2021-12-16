import 'package:marvel_api/app/core/domain/value_objects/value_objects.dart';
import 'package:marvel_api/app/core/helpers/errors/domain_error.dart';

abstract class Usecase {
  DomainError getError(ValueObjects valueObject) {
    return DomainError(
        message: valueObject.errorMessage, stackTrace: StackTrace.current);
  }

  bool hasError(ValueObjects valueObject) {
    if (valueObject.isValid()) {
      return false;
    }
    return true;
  }
}

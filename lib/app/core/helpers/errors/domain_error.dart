import 'failure.dart';

class DomainError extends Failure {
  DomainError({
    required String message,
    required StackTrace stackTrace,
  }) : super(message, stackTrace);
}

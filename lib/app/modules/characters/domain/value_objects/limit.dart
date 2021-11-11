import '../../../../core/value_objects/value_objects.dart';

class Limit extends ValueObjects<int> {
  const Limit({required int value})
      : super(value: value, errorMessage: 'Limit deve estar entre 1 e 100');

  @override
  bool isValid() {
    return value > 1 && value <= 100;
  }
}

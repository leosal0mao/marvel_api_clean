abstract class ValueObjects<T> {
  final T value;
  final String errorMessage;

  const ValueObjects({required this.value, required this.errorMessage});

  bool isValid();
}

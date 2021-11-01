import 'package:equatable/equatable.dart';
import 'data.dart';

class Characters extends Equatable {
  final int code;
  final String status;
  final Data data;

  const Characters({
    required this.code,
    required this.status,
    required this.data,
  });

  @override
  List<Object?> get props => [code, status, data];
}

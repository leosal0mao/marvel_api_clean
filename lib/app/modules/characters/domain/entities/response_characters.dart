import 'package:equatable/equatable.dart';
import 'data.dart';

class ResponseCharacter extends Equatable {
  final int code;
  final String status;
  final Data data;

  const ResponseCharacter({
    required this.code,
    required this.status,
    required this.data,
  });

  @override
  List<Object?> get props => [code, status, data];
}

import 'package:equatable/equatable.dart';
import 'character.dart';

class Data extends Equatable {
  final int offset;
  final int limit;
  final int total;
  final int count;
  final List<Character> characters;

  const Data({
    required this.offset,
    required this.limit,
    required this.total,
    required this.count,
    required this.characters,
  });

  @override
  List<Object?> get props => [offset, limit, total, count, characters];
}

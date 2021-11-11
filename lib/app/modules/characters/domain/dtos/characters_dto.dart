import 'package:equatable/equatable.dart';
import '../value_objects/limit.dart';

class CharactersDto extends Equatable {
  final String? name;
  final String? nameStartsWith;
  final Limit limit;
  final int offset;

  const CharactersDto({
    this.name,
    this.nameStartsWith,
    required this.limit,
    required this.offset,
  });

  CharactersDto copyWith(
      {String? name, String? nameStartsWith, Limit? limit, int? offset}) {
    return CharactersDto(
      name: name ?? this.name,
      nameStartsWith: nameStartsWith ?? this.nameStartsWith,
      limit: limit ?? this.limit,
      offset: offset ?? this.offset,
    );
  }

  Map<String, dynamic> toMap() => {
        'name': name,
        'nameStartsWith': nameStartsWith,
        'limit': limit.value,
        'offset': offset,
      };

  @override
  List<Object?> get props => [name, nameStartsWith, limit, offset];
}

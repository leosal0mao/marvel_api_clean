import 'package:equatable/equatable.dart';

class CharactersDto extends Equatable {
  final String name;
  final String nameStartsWith;
  final int limit;
  final int offset;

  const CharactersDto(
    this.name,
    this.nameStartsWith,
    this.limit,
    this.offset,
  );

  CharactersDto copyWith(
      {String? name, String? nameStartsWith, int? limit, int? offset}) {
    return CharactersDto(
      name ?? this.name,
      nameStartsWith ?? this.nameStartsWith,
      limit ?? this.limit,
      offset ?? this.offset,
    );
  }

  Map<String, dynamic> toMap() => {
        'name': name,
        'nameStartsWith': nameStartsWith,
        'limit': limit,
        'offset': offset,
      };

  @override
  List<Object?> get props => [name, nameStartsWith, limit, offset];
}

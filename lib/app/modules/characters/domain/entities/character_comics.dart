import 'package:equatable/equatable.dart';

class CharacterComics extends Equatable {
  final int available;
  final List<ComicItem> items;

  const CharacterComics({
    required this.available,
    required this.items,
  });

  @override
  List<Object?> get props => [available, items];
}

class ComicItem extends Equatable {
  final String name;

  const ComicItem({
    required this.name,
  });

  @override
  List<Object?> get props => [name];
}

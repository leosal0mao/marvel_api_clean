import '../../domain/entities/character_comics.dart';

import '../../domain/entities/entities.dart';
import '../helpers/errors/errors.dart';

class CharacterComicsMapper {
  CharacterComicsMapper._();

  static CharacterComics fromMap(Map<String, dynamic> map) {
    try {
      return CharacterComics(
        available: map['available'],
        items: ComicsItemMapper.fromListMap(
            (map['items'] as List).cast<Map<String, dynamic>>()),
      );
    } catch (e, stack) {
      throw CharacterComicsMapperErrors(e.toString(), stack);
    }
  }
}

class ComicsItemMapper {
  ComicsItemMapper._();

  static List<ComicItem> fromListMap(List<Map<String, dynamic>> maps) {
    try {
      return maps.map((e) => fromMap(e)).toList();
    } catch (e, stack) {
      throw ComicsMapperErrors(e.toString(), stack);
    }
  }

  static ComicItem fromMap(Map<String, dynamic> map) {
    try {
      return ComicItem(
        name: map['name'],
      );
    } catch (e, stack) {
      throw ComicsMapperErrors(e.toString(), stack);
    }
  }
}

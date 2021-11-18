import '../../domain/entities/entities.dart';
import '../helpers/errors/errors.dart';
import 'mappers.dart';

class CharacterMapper {
  CharacterMapper._();

  static Character fromMap(Map<String, dynamic> map) {
    try {
      return Character(
          id: map['id'],
          name: map['name'],
          description: map['description'],
          characterImage: CharacterImageMapper.fromMap(map['thumbnail']),
          characterComics: CharacterComicsMapper.fromMap(map['comics']));
    } catch (e, stack) {
      throw CharacterMapperErrors(e.toString(), stack);
    }
  }

  static List<Character>? fromListMap(List<Map<String, dynamic>>? maps) {
    try {
      return maps?.map((map) => fromMap(map)).toList();
    } catch (e, stack) {
      throw CharacterMapperErrors(e.toString(), stack);
    }
  }
}

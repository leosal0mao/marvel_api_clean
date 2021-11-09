import '../../domain/entities/entities.dart';
import '../helpers/errors/errors.dart';

class CharacterImageMapper {
  CharacterImageMapper._();

  static CharacterImage fromMap(Map<String, dynamic> map) {
    try {
      return CharacterImage(
        path: map['path'],
        extension: map['extension'],
      );
    } catch (e, stack) {
      throw CharacterImageMapperErrors(e.toString(), stack);
    }
  }
}

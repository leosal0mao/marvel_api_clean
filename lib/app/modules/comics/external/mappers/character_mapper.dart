import 'dart:convert';

import 'package:marvel_api/app/modules/comics/domain/entities/entities.dart';
import 'package:marvel_api/app/modules/comics/external/helpers/errors/errors.dart';
import 'package:marvel_api/app/modules/comics/external/mappers/mappers.dart';

class CharacterMapper {
  CharacterMapper._();

  static Character fromMap(Map<String, dynamic> map) {
    try {
      return Character(
        id: map['id'],
        name: map['name'],
        description: map['description'],
        characterImage: CharacterImageMapper.fromMap(map['thumbnail']),
      );
    } catch (e, stack) {
      throw CharacterMapperErrors(e.toString(), stack);
    }
  }

  static Character fromJson(String source) {
    try {
      return CharacterMapper.fromMap(json.decode(source));
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

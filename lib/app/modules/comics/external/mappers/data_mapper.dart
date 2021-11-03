import 'dart:convert';

import 'package:marvel_api/app/modules/comics/domain/entities/entities.dart';
import 'package:marvel_api/app/modules/comics/external/helpers/errors/errors.dart';
import 'package:marvel_api/app/modules/comics/external/mappers/mappers.dart';

class DataMapper {
  DataMapper._();

  static Data fromMap(Map<String, dynamic> map) {
    try {
      return Data(
        offset: map['offset'],
        limit: map['limit'],
        total: map['total'],
        count: map['count'],
        characters: CharacterMapper.fromListMap(
            (map['results'] as List?)?.cast<Map<String, dynamic>>()),
      );
    } catch (e, stack) {
      throw DataMapperErrors(e.toString(), stack);
    }
  }

  static List<Data> fromListMap({required List<Map<String, dynamic>> maps}) {
    try {
      return maps.map((map) => fromMap(map)).toList();
    } catch (e, stack) {
      throw DataMapperErrors(e.toString(), stack);
    }
  }

  static Data fromJson(String source) {
    try {
      return DataMapper.fromMap(json.decode(source));
    } catch (e, stack) {
      throw DataMapperErrors(e.toString(), stack);
    }
  }
}

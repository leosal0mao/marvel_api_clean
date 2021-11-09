import '../../domain/entities/entities.dart';
import '../helpers/errors/errors.dart';
import 'mappers.dart';

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
}

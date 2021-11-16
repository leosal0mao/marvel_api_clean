import '../../domain/entities/entities.dart';
import '../helpers/errors/errors.dart';
import 'mappers.dart';

class ResponseMapper {
  ResponseMapper._();

  static ResponseCharacters fromMap(Map<String, dynamic> map) {
    try {
      return ResponseCharacters(
          code: map['code'],
          status: map['status'],
          data: DataMapper.fromMap(map['data']));
    } catch (e, stack) {
      throw ResponseMapperErrors(e.toString(), stack);
    }
  }

  static List<ResponseCharacters> fromListMap(
      {required List<Map<String, dynamic>> maps}) {
    try {
      return maps.map((map) => fromMap(map)).toList();
    } catch (e, stack) {
      throw ResponseMapperErrors(e.toString(), stack);
    }
  }
}

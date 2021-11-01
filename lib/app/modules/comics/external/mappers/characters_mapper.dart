import '../../domain/entities/entities.dart';
import '../helpers/errors/errors.dart';

class CharactersMapper {
  CharactersMapper._();

  static Characters fromMap(Map<String, dynamic> map) {
    try {
      return Characters(
          code: map['code'],
          status: map['status'],
          data: DataMapper.fromMap('data'));
    } catch (e, stack) {
      throw CharactersMapperErrors(e.toString(), stack);
    }
  }
}

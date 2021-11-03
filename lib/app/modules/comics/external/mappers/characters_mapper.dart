import 'dart:convert';

import '../../domain/entities/entities.dart';
import '../helpers/errors/errors.dart';
import 'mappers.dart';

class CharactersMapper {
  CharactersMapper._();

  static Characters fromMap(Map<String, dynamic> map) {
    try {
      return Characters(
          code: map['code'],
          status: map['status'],
          data: DataMapper.fromMap(map['data']));
    } catch (e, stack) {
      throw CharactersMapperErrors(e.toString(), stack);
    }
  }

  static List<Characters> fromListMap(
      {required List<Map<String, dynamic>> maps}) {
    try {
      return maps.map((map) => fromMap(map)).toList();
    } catch (e, stack) {
      throw CharactersMapperErrors(e.toString(), stack);
    }
  }

  static Characters fromJson(String source) {
    try {
      return CharactersMapper.fromMap(json.decode(source));
    } catch (e, stack) {
      throw CharactersMapperErrors(e.toString(), stack);
    }
  }
}

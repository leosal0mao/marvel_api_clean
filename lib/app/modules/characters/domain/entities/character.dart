import 'package:equatable/equatable.dart';
import 'package:marvel_api/app/modules/characters/domain/entities/character_comics.dart';
import 'character_image.dart';

class Character extends Equatable {
  final int id;
  final String name;
  final String description;
  final CharacterImage characterImage;
  final CharacterComics characterComics;

  const Character({
    required this.id,
    required this.name,
    required this.description,
    required this.characterImage,
    required this.characterComics,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        characterImage,
        characterComics,
      ];
}

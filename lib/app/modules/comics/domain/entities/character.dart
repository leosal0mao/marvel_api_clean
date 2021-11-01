import 'package:equatable/equatable.dart';
import 'character_image.dart';

class Character extends Equatable {
  final int id;
  final String name;
  final String description;
  final CharacterImage characterImage;

  const Character({
    required this.id,
    required this.name,
    required this.description,
    required this.characterImage,
  });

  @override
  List<Object?> get props => [id, name, description, characterImage];
}

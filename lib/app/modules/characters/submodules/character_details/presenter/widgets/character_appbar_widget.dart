import 'package:flutter/material.dart';
import 'package:marvel_api/app/modules/characters/domain/entities/entities.dart';

class CharacterAppbarWidget extends StatelessWidget {
  final Character character;
  final bool? centerTitle;

  const CharacterAppbarWidget({
    Key? key,
    required this.character,
    this.centerTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text(
        character.name,
        style: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
      iconTheme: const IconThemeData(color: Colors.white),
      centerTitle: centerTitle,
      expandedHeight: 300.0,
      pinned: true,
      elevation: 5,
      flexibleSpace: FlexibleSpaceBar(
        background: Hero(
          tag: character.id,
          child: Image.network(
            character.characterImage.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

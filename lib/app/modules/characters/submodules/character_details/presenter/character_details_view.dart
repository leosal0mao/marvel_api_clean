import 'package:flutter/material.dart';

import 'package:marvel_api/app/modules/characters/domain/entities/entities.dart';

class CharacterDetailsView extends StatelessWidget {
  final Character characterDetails;

  const CharacterDetailsView({
    Key? key,
    required this.characterDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[],
      ),
    );
  }
}

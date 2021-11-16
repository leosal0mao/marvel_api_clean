import 'package:flutter/material.dart';
import 'package:marvel_api/app/modules/characters/domain/entities/entities.dart';

class CharacterCardWidget extends StatelessWidget {
  final Function onTap;
  final Character? character;

  const CharacterCardWidget({
    Key? key,
    required this.onTap,
    required this.character,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return SizedBox(
      height: height / 3,
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Row(
          children: [
            Flexible(
              flex: 1,
              child: character!.characterImage.path == ""
                  ? Image.network(
                      'https://cdnb.artstation.com/p/assets/images/images/032/796/739/large/rait-visual-works-genshin-impact-paimon.jpg?1607501613')
                  : Image.network(character!.characterImage.image),
            ),
            Flexible(
              flex: 2,
              child: Container(),
            ),
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 5,
        margin: const EdgeInsets.all(10),
      ),
    );
  }
}

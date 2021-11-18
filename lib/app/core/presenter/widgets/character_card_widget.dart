import 'package:flutter/material.dart';

import '../../../modules/characters/domain/entities/entities.dart';

class CharacterCardWidget extends StatelessWidget {
  final VoidCallback onTap;
  final Character? character;

  const CharacterCardWidget({
    Key? key,
    required this.onTap,
    required this.character,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var _itemsWidth = width / 6;
    var _itemsHeight = height / 4;

    return SizedBox(
      height: _itemsHeight,
      child: Card(
        semanticContainer: true,
        child: InkWell(
          onTap: onTap,
          child: Row(
            children: [
              SizedBox(
                height: _itemsHeight,
                child: character!.characterImage.path == ""
                    ? Image.network(
                        'https://cdnb.artstation.com/p/assets/images/images/032/796/739/large/rait-visual-works-genshin-impact-paimon.jpg?1607501613')
                    : ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                        child: Image.network(
                          character!.characterImage.image,
                          fit: BoxFit.fitHeight,
                          width: _itemsWidth,
                        ),
                      ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 8.0,
                    bottom: 8.0,
                    left: 5.0,
                    right: 5.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        character!.name,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        character!.description,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "More info",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios_rounded),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 5,
      ),
    );
  }
}

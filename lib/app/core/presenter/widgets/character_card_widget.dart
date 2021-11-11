import 'package:flutter/material.dart';

class CharacterCardWidget extends StatelessWidget {
  final String name;
  final String description;
  final String image;
  final Function onTap;

  const CharacterCardWidget(
      {Key? key,
      required this.name,
      required this.description,
      required this.image,
      required this.onTap})
      : super(key: key);

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
              child: image == ''
                  ? Image.network(
                      'https://cdnb.artstation.com/p/assets/images/images/032/796/739/large/rait-visual-works-genshin-impact-paimon.jpg?1607501613')
                  : Image.network(image),
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

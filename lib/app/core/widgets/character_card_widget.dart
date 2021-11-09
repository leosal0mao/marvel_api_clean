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
    return Card(
      elevation: 2,
      child: ListTile(
        leading: image == ''
            ? Image.network(
                'https://cdnb.artstation.com/p/assets/images/images/032/796/739/large/rait-visual-works-genshin-impact-paimon.jpg?1607501613')
            : Image.network(image),
        title: Text(name),
        subtitle: Text(description),
      ),
    );
  }
}

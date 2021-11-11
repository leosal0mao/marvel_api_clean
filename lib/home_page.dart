import 'package:flutter/material.dart';

import 'app/core/presenter/widgets/character_card_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
              itemCount: 6,
              itemBuilder: (context, i) {
                return CharacterCardWidget(
                    name: 'name $i',
                    description: 'description $i',
                    image: '',
                    onTap: () {});
              })),
    );
  }
}

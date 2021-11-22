import 'package:flutter/material.dart';

import '../../../domain/entities/entities.dart';
import 'widgets/character_appbar_widget.dart';
import 'widgets/comic_list_tile.dart';

class CharacterDetailsView extends StatefulWidget {
  final Character characterDetails;

  const CharacterDetailsView({
    Key? key,
    required this.characterDetails,
  }) : super(key: key);

  @override
  State<CharacterDetailsView> createState() => _CharacterDetailsViewState();
}

class _CharacterDetailsViewState extends State<CharacterDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        slivers: <Widget>[
          CharacterAppbarWidget(
            character: widget.characterDetails,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 10.0,
                bottom: 10.0,
                left: 15.0,
                right: 15.0,
              ),
              child: Text(
                widget.characterDetails.description == ''
                    ? 'No description provided.'
                    : widget.characterDetails.description,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 15),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'FEATURED COMICS',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              widget.characterDetails.characterComics.items
                  .map((e) => ComicListTile(comicName: e.name))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

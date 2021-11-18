import 'package:flutter/material.dart';

class ComicListTile extends StatelessWidget {
  final String comicName;
  const ComicListTile({
    Key? key,
    required this.comicName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.menu_book_rounded),
      title: const Text('Issue: '),
      subtitle: Text(comicName),
    );
  }
}

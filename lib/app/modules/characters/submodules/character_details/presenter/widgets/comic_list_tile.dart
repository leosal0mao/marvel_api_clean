import 'package:flutter/material.dart';

class ComicListTile extends StatelessWidget {
  const ComicListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.menu_book_rounded),
      title: Text('Sunday'),
      subtitle: Text('sunny, h: 80, l: 65'),
    );
  }
}

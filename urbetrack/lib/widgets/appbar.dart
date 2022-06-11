import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;
  final String? title;
  MyAppBar({Key? key, this.title = 'StarWars Personajes App'})
      : preferredSize = const Size.fromHeight(56.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("$title"),
      centerTitle: true,
      elevation: 2,
      backgroundColor: Colors.black,
    );
  }
}

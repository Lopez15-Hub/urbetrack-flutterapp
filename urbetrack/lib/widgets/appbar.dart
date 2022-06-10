import 'package:flutter/material.dart';
class MyAppBar extends StatelessWidget with PreferredSizeWidget {
@override
  final Size preferredSize;

  MyAppBar({Key? key}) : preferredSize = const Size.fromHeight(56.0), super(key: key);

  @override
   Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Starwars App'),
      centerTitle: true,
      elevation: 2,
      backgroundColor: Colors.black,
    );
  }
}
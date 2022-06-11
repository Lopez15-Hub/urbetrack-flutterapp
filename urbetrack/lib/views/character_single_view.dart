import 'package:flutter/material.dart';
import 'package:urbetrack/models/star_wars_character.dart';
import 'package:urbetrack/widgets/appbar.dart';

class CharacterSingleView extends StatelessWidget {
  final StarWarsCharacter characterData;
  const CharacterSingleView({Key? key, required this.characterData})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Datos del personaje'),
      body: Center(
        child: Text(characterData.name),
      ),
    );
  }
}

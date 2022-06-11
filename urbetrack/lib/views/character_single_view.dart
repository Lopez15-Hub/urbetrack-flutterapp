import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:urbetrack/models/character.dart';
import '../services/swapi_service.dart';
import '../widgets/widgets.dart';

class CharacterSingleView extends StatelessWidget {
  final Character characterData;
  const CharacterSingleView({Key? key, required this.characterData})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final swapiService = RepositoryProvider.of<SwapiService>(context);
    return Scaffold(
      appBar: MyAppBar(title: 'Datos del personaje'),
      body: CharacterMetadataWidget(swapiService: swapiService, characterData: characterData),
    );
  }
}



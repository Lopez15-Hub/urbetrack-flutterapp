import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:urbetrack/blocs/api_queries/api_queries_bloc.dart';
import 'package:urbetrack/models/character.dart';
import '../../blocs/blocs.dart';
import '../../services/swapi_service.dart';
import '../widgets.dart';

class CharacterMetadataWidget extends StatelessWidget {
  const CharacterMetadataWidget({
    Key? key,
    required this.swapiService,
    required this.characterData,
  }) : super(key: key);

  final SwapiService swapiService;
  final Character characterData;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ApiQueriesBloc(swapiService)
        ..add(FetchPlanetNameEvent(characterData.homeworld)),
      child: Card(
        elevation: 10,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CharacterGeneralData(characterData: characterData),
              const Divider(),
              CharacterBodyData(characterData: characterData),
              const Divider(),
              const CharacterHomeworld(),
              const Divider(),
              CharacterVehiclesData(characterData: characterData, swapiService: swapiService),
              CharacterStarshipsData(characterData: characterData, swapiService: swapiService)
            ],
          ),
        ),
      ),
    );
  }
}








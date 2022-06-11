import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:urbetrack/blocs/api_queries/api_queries_bloc.dart';
import 'package:urbetrack/models/character.dart';
import '../blocs/blocs.dart';
import '../services/swapi_service.dart';
import '../widgets/custom_text.dart';
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: "Nombre: ${characterData.name}",
            fontSize: 16,
            weight: FontWeight.bold,
          ),
          CustomText(
            text: "Fecha de nacimiento: ${characterData.birthYear}",
            fontSize: 16,
            weight: FontWeight.bold,
          ),
          CustomText(
            text:
                "Género: ${characterData.gender == 'male' ? 'Masculino' : characterData.gender == 'female' ? 'Femenino' : 'Sin especificar'}",
            fontSize: 16,
            weight: FontWeight.bold,
          ),
          CustomText(
            text: "Color de ojos: ${characterData.eyeColor}",
            fontSize: 16,
            weight: FontWeight.bold,
          ),
          CustomText(
            text: "Color de pelo: ${characterData.hairColor}",
            fontSize: 16,
            weight: FontWeight.bold,
          ),
          CustomText(
            text: "Altura: ${characterData.height}",
            fontSize: 16,
            weight: FontWeight.bold,
          ),
          CustomText(
            text: "Peso: ${characterData.mass}",
            fontSize: 16,
            weight: FontWeight.bold,
          ),
          BlocBuilder<ApiQueriesBloc, ApiQueriesState>(
            builder: (context, state) {
              if (state is SetPlanetName)return CustomText( text: 'Mundo natal: ${state.planetName}',fontSize: 16,weight: FontWeight.bold,);
              return const Text("Mundo natal no definido");
            },
          ),    
          BlocProvider(
            create: (context) =>
                ApiQueriesBloc(swapiService)..add(FetchVehiclesEvent()),
            child: BlocBuilder<ApiQueriesBloc, ApiQueriesState>(
              builder: (context, state) {
                if (state is SetVehicles) {
                    return CustomText(
                              text: 'Vehiculo: ${state.results[0].name }',
                              fontSize: 16,
                              weight: FontWeight.bold,
                            );
                }
                return const Text("Vehiculo no definido");
              },
            ),
          ),
          Text("Naves espaciales: ${characterData.starships}"),
        ],
      ),
    );
  }
}
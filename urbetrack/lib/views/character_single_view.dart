import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:urbetrack/blocs/api_queries/api_queries_bloc.dart';
import 'package:urbetrack/models/character.dart';
import 'package:urbetrack/widgets/appbar.dart';
import '../blocs/blocs.dart';
import '../services/swapi_service.dart';

class CharacterSingleView extends StatelessWidget {
  final Character characterData;
  const CharacterSingleView({Key? key, required this.characterData})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final swapiService = RepositoryProvider.of<SwapiService>(context);
    return Scaffold(
      appBar: MyAppBar(title: 'Datos del personaje'),
      body: BlocProvider(
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
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
    required this.text,
    this.fontSize = 12,
    this.weight = FontWeight.normal,
  }) : super(key: key);
  final double fontSize;
  final String text;
  final FontWeight weight;

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontSize: fontSize,
      fontWeight: weight,
    );
    return Column(
      children: [
        Text(
          text,
          style: textStyle,
          textAlign: TextAlign.start,
        ),
        const Divider()
      ],
    );
  }
}

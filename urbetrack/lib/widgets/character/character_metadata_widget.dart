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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const CustomText(
                    text: "Datos generales",
                    fontSize: 20,
                    weight: FontWeight.bold,
                  ),
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
                ],
              ),
              const Divider(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(
                    text: "Datos físicos",
                    fontSize: 20,
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
                ],
              ),
              const Divider(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(
                    text: "Mundo Natal",
                    fontSize: 20,
                    weight: FontWeight.bold,
                  ),
                  BlocBuilder<ApiQueriesBloc, ApiQueriesState>(
                    builder: (context, state) {
                      if (state is SetPlanetName) {
                        return CustomText(
                          text: state.planetName,
                          fontSize: 16,
                          weight: FontWeight.bold,
                        );
                      }
                      return const LoadingIndicator(loadingText: "Cargando...");
                    },
                  ),
                ],
              ),
              const Divider(),
              Visibility(
                visible: characterData.vehicles.isNotEmpty ? true : false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomText(
                      text: "Vehiculos",
                      fontSize: 20,
                      weight: FontWeight.bold,
                    ),
                    BlocProvider(
                      create: (context) => ApiQueriesBloc(swapiService)
                        ..add(FetchVehiclesEvent(
                            characterData.vehicles.toList())),
                      child: BlocBuilder<ApiQueriesBloc, ApiQueriesState>(
                        builder: (context, state) {
                          if (state is SetVehicles) {
                            return SizedBox(
                              height: 40,
                              child: ListView.builder(
                                itemCount: state.vehicles.length,
                                itemBuilder: (context, index) {
                                  return CustomText(
                                    text: state.vehicles[index].name,
                                    fontSize: 16,
                                    weight: FontWeight.bold,
                                  );
                                },
                              ),
                            );
                          }
                          return const LoadingIndicator(
                              loadingText: "Cargando...");
                        },
                      ),
                    ),
                    const Divider(),
                  ],
                ),
              ),
              Visibility(
                visible: characterData.starships.isNotEmpty ? true : false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomText(
                      text: "Naves espaciales",
                      fontSize: 20,
                      weight: FontWeight.bold,
                    ),
                    BlocProvider(
                      create: (context) => ApiQueriesBloc(swapiService)
                        ..add(FetchStarshipsEvent(
                            characterData.starships.toList())),
                      child: BlocBuilder<ApiQueriesBloc, ApiQueriesState>(
                        builder: (context, state) {
                          if (state is SetStarships) {
                            return SizedBox(
                              height: 40,
                              width: MediaQuery.of(context).size.width,
                              child: ListView.builder(
                                itemCount: state.starships.length,
                                itemBuilder: (context, index) {
                                  return Text(
                                    state.starships[index].name,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  );
                                },
                              ),
                            );
                          }
                          return const LoadingIndicator(
                              loadingText: "Cargando...");
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

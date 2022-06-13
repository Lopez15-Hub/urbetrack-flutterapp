import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/blocs.dart';
import '../../models/models.dart';
import '../../services/services.dart';
import '../widgets.dart';
class CharacterStarshipsData extends StatelessWidget {
  const CharacterStarshipsData({
    Key? key,
    required this.characterData,
    required this.swapiService,
  }) : super(key: key);

  final Character characterData;
  final SwapiService swapiService;

  @override
  Widget build(BuildContext context) {
    return Visibility(
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
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/blocs.dart';
import '../../models/models.dart';
import '../../services/services.dart';
import '../widgets.dart';

class CharacterVehiclesData extends StatelessWidget {
  const CharacterVehiclesData({
    Key? key,
    required this.characterData,
    required this.swapiService,
  }) : super(key: key);

  final Character characterData;
  final SwapiService swapiService;

  @override
  Widget build(BuildContext context) {
    return Visibility(
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
    );
  }
}
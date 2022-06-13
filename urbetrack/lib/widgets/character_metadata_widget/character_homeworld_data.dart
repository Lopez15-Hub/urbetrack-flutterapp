import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/blocs.dart';
import '../widgets.dart';
class CharacterHomeworld extends StatelessWidget {
  const CharacterHomeworld({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}

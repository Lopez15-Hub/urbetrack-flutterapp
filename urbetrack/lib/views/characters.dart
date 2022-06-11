import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:urbetrack/blocs/api_queries/api_queries_bloc.dart';
import 'package:urbetrack/services/swapi_service.dart';
import '../widgets/widgets.dart';

class StarWarsCharacters extends StatelessWidget {
  const StarWarsCharacters({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final swapiService = RepositoryProvider.of<SwapiService>(context);
    return BlocProvider(
      create: (context) =>
          ApiQueriesBloc(swapiService)..add(FetchStarWarsData()),
      child: BlocBuilder<ApiQueriesBloc, ApiQueriesState>(
        builder: (context, state) {
          if (state is SetResponseData) {
            return ListView.separated(
                separatorBuilder: (context, index) => const Divider(),
                physics: const BouncingScrollPhysics(),
                itemCount: state.results.length,
                itemBuilder: (context, characterIndex) {
                  return CharacterListItem(
                    responseDataState: state,
                    characterIndex: characterIndex,
                  );
                });
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

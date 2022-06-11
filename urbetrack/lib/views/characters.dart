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
      create: (context) =>ApiQueriesBloc(swapiService)..add(FetchStarWarsDataEvent()),
      child: const CharactersListData(),
    );
  }
}

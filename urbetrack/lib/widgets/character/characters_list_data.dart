import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:urbetrack/blocs/api_queries/api_queries_bloc.dart';

import '../widgets.dart';
import 'character_list_item.dart';
class CharactersListData extends StatelessWidget {
  const CharactersListData({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApiQueriesBloc, ApiQueriesState>(
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
        return const LoadingIndicator(loadingText: 'Obteniendo personajes...',);
      },
    );
  }
}

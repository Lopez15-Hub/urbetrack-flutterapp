import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/blocs.dart';
import '../widgets.dart';
class CharactersList extends StatelessWidget {
  const CharactersList({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<ApiQueriesBloc, ApiQueriesState>(
        builder: (context, state) {
          if (state is SetResponseData) {
            return ListView.separated(
                controller: scrollController,
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

          return const LoadingIndicator(
            loadingText: 'Obteniendo personajes...',
          );
        },
      ),
    );
  }
}

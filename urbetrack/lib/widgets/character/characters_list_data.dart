import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:urbetrack/blocs/api_queries/api_queries_bloc.dart';
import '../widgets.dart';

class CharactersListData extends StatefulWidget {
  const CharactersListData({
    Key? key,
  }) : super(key: key);

  @override
  State<CharactersListData> createState() => _CharactersListDataState();
}

class _CharactersListDataState extends State<CharactersListData> {
  final ScrollController scrollController = ScrollController();
  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        BlocProvider.of<ApiQueriesBloc>(context).add(FetchStarWarsDataEvent());
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApiQueriesBloc, ApiQueriesState>(
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
    );
  }
}

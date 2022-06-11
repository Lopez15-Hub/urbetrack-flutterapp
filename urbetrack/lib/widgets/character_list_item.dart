import 'package:flutter/material.dart';
import '../blocs/api_queries/api_queries_bloc.dart';
import '../views/character_single_view.dart';
class CharacterListItem extends StatelessWidget {
  final SetResponseData responseDataState;
  final int characterIndex;
  const CharacterListItem(
      {Key? key, required this.responseDataState, required this.characterIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(responseDataState.results[characterIndex].name),
      subtitle: Text(responseDataState.results[characterIndex].gender == 'male'
          ? 'Masculino'
          : responseDataState.results[characterIndex].gender == 'female'
              ? 'Femenino'
              : 'Sin especificar'),
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CharacterSingleView(
                    characterData: responseDataState.results[characterIndex],
                  ))),
    );
  }
}
import 'package:flutter/material.dart';
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
  int index = 1;
  @override
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CharactersList(scrollController: scrollController),
        const PaginationButtons(),
      ],
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:urbetrack/blocs/bottom_bar_navigation_bloc/bottom_bar_navigation_bloc.dart';
import 'package:urbetrack/views/characters.dart';
import 'package:urbetrack/views/menu.dart';

class Pages extends StatelessWidget {
  const Pages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomBarNavigationBloc, int>(
      builder: (context, currentIndex) {
        switch (currentIndex) {
          case 0:
            return const StarWarsCharacters();
          case 1:
            return const Menu();
          default:
            Container();
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}

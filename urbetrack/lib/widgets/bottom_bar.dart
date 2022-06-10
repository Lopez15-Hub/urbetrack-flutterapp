import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:urbetrack/blocs/bottom_bar_navigation_bloc/bottom_bar_navigation_bloc.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationBloc = context.read<BottomBarNavigationBloc>();
    return BlocBuilder<BottomBarNavigationBloc,int>(
      builder: (context, currentIndex) {
        return BottomNavigationBar(
            onTap: (value) => navigationBloc.add(ChangePageView(value)),
            currentIndex:currentIndex,
            selectedIconTheme:
                const IconThemeData(color: Color.fromARGB(255, 255, 208, 0)),
            selectedItemColor: Colors.black,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.people), label: "Personajes"),
              BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Menu")
            ]);
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:urbetrack/blocs/bottom_bar_navigation_bloc/bottom_bar_navigation_bloc.dart';
import 'package:urbetrack/views/menu.dart';
import 'package:urbetrack/views/network_status_page.dart';

import '../widgets/widgets.dart';



class Pages extends StatelessWidget {
  const Pages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomBarNavigationBloc, int>(
      builder: (context, currentIndex) {
        switch (currentIndex) {
          case 0:
            return const NetworkStatusPage();
          case 1:
            return const Menu();
          default:
            Container();
        }
        return const LoadingIndicator();
      },
    );
  }
}



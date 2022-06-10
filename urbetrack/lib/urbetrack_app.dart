import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:urbetrack/blocs/bottom_bar_navigation_bloc/bottom_bar_navigation_bloc.dart';
import 'package:urbetrack/views/home.dart';


class UrbetrackApp extends StatelessWidget {
  const UrbetrackApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BottomBarNavigationBloc>(
          create: (context) => BottomBarNavigationBloc(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );
  }
}

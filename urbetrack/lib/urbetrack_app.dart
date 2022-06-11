import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:urbetrack/services/swapi_service.dart';
import 'package:urbetrack/views/home.dart';

import 'blocs/blocs.dart';

class UrbetrackApp extends StatelessWidget {


  const UrbetrackApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => SwapiService()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<BottomBarNavigationBloc>(create: (context) => BottomBarNavigationBloc(),),
          BlocProvider<ConnectionBloc>(create: (context) => ConnectionBloc(),),
          BlocProvider<ReportBloc>(create: (context) => ReportBloc(),),
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Home(),
        ),
      ),
    );
  }
}

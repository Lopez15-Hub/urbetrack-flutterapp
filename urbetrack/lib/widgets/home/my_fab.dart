import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:urbetrack/blocs/connection/connection_bloc.dart';

class MyFab extends StatelessWidget {
  const MyFab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectionBloc, bool>(
      builder: (context, isConnectedToNetwork) {
        return FloatingActionButton(
          onPressed: isConnectedToNetwork? () {} : null,
          tooltip: 'Reportar avistamiento',
          backgroundColor: isConnectedToNetwork? Colors.yellow[700] : Colors.grey,
          child: const Icon(Icons.report),
        );
      },
    );
  }
}

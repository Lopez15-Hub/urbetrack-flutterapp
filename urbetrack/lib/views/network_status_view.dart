import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:urbetrack/blocs/connection/connection_bloc.dart';
import 'characters_view.dart';
class NetworkStatusPage extends StatelessWidget {
  const NetworkStatusPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectionBloc, bool>(
      builder: (context, isConnectedToNetwork) {
        return isConnectedToNetwork
            ? const StarWarsCharacters()
            : const Center(
                child: Text("No hay conexión a internet"),
              );
      },
    );
  }
}
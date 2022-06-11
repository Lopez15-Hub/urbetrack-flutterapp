import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/connection/connection_bloc.dart';
class NetworkSwitch extends StatelessWidget {
  const NetworkSwitch({
    Key? key,
    required this.connectionBloc,
  }) : super(key: key);

  final ConnectionBloc connectionBloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectionBloc, bool>(
      builder: (context, isConnectedToNetwork) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Text(isConnectedToNetwork? 'Estado de conexión: Conectado' : 'Estado de conexión: Desconectado'),
              Switch(
                onChanged: (isConnectedToNetwork) => connectionBloc
                    .add(ConnectToNetworkEvent(!isConnectedToNetwork)),
                value: isConnectedToNetwork,
              ),
                 Text(isConnectedToNetwork? 'Desconectar' : 'Conectar'),
            ],
          ),
        );
      },
    );
  }
}
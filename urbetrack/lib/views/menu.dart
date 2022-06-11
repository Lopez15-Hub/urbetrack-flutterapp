import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/blocs.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final connectionBloc = context.read<ConnectionBloc>();
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

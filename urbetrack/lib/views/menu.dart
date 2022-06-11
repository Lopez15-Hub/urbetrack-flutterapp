import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/blocs.dart';
import '../widgets/home/network_switch.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final connectionBloc = context.read<ConnectionBloc>();
    return NetworkSwitch(connectionBloc: connectionBloc);
  }
}



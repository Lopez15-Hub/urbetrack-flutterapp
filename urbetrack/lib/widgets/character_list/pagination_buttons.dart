import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/blocs.dart';

class PaginationButtons extends StatelessWidget {
  const PaginationButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApiQueriesBloc, ApiQueriesState>(
      builder: (context, state) {
        if (state is SetResponseData) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                  onPressed: () => state.previous.toString() == 'null'
                      ? null
                      : BlocProvider.of<ApiQueriesBloc>(context)
                          .add(FetchMorePeopleEvent(state.previous)),
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(20),
                      primary: state.previous.toString() == 'null'
                          ? Colors.grey
                          : Colors.yellow[700]),
                  child: const Text("Anterior")),
              ElevatedButton(
                  onPressed: () => BlocProvider.of<ApiQueriesBloc>(context)
                      .add(FetchMorePeopleEvent(state.next)),
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(20),
                      textStyle: const TextStyle(color: Colors.white),
                      primary: Colors.yellow[700]),
                  child: const Text("Siguiente")),
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }
}

import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  final String loadingText;
  const LoadingIndicator({Key? key, this.loadingText = 'Cargando...'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(
            color: Color.fromRGBO(251, 192, 45, 1),
          ),
          Text(loadingText, style: const TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}

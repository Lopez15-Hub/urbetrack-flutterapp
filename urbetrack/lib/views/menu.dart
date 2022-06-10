import 'package:flutter/material.dart';
class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
         const Text("Desconectarse"),
          Switch(
         onChanged: (e)=>print(e),   
            value: false,
          ),
        ],
      )
    );
  }
}
import 'package:flutter/material.dart';
import 'package:urbetrack/views/pages.dart';

import '../widgets/widgets.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: MyAppBar(),
      body: const Pages(),
      floatingActionButton: const MyFab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const BottomBar(),
    );
  }
}

class MyFab extends StatelessWidget {
  const MyFab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      
      onPressed: () {},
      tooltip: 'Reportar avistamiento',
      backgroundColor: Colors.yellow[700],
      child: const Icon(Icons.report),
    );
  }
}




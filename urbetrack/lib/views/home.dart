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
      bottomNavigationBar: const BottomBar(),
    );
  }
}




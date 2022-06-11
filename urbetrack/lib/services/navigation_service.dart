import 'package:flutter/cupertino.dart';

class NavigationService extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  setCurrentIndex(index) {
    _currentIndex = index;
    notifyListeners();
  }
}

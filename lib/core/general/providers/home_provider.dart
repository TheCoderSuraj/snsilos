import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  int _bottomNavigatorIndex = 0;
  int get currentBottomNavigatorIndex => _bottomNavigatorIndex;

  void setBottomNavigatorIndex(int value) {
    _bottomNavigatorIndex = value;
    notifyListeners();
  }
}

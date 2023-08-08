import 'package:flutter/material.dart';

class OtpPageModel extends ChangeNotifier {
  int _currentPageIndex = 0;

  int get currentPageIndex => _currentPageIndex;

  void updateCurrentPageIndex(int newIndex) {
    _currentPageIndex = newIndex;
    notifyListeners();
  }
}

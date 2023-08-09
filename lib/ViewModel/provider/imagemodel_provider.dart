import 'package:flutter/material.dart';

class ImageProviderModel extends ChangeNotifier {
  String _selectedImagePath = '';

  String get selectedImagePath => _selectedImagePath;

  void updateImagePath(String path) {
    _selectedImagePath = path;
    notifyListeners();
  }
}

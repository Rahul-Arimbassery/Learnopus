import 'dart:io';
import 'package:flutter/foundation.dart';

class PostState extends ChangeNotifier {
  File? _image;
  String _text = '';

  File? get image => _image;
  String get text => _text;

  void setImage(File? image) {
    _image = image;
    notifyListeners();
  }

  void setText(String text) {
    _text = text;
    notifyListeners();
  }
}

import 'package:flutter/foundation.dart';

class DropdownModel extends ChangeNotifier {
  String selectedCourse = 'Select';
  String selectedUniversity = 'Select';
  String selectedQualification = 'Select';

void updateCourse(String? newValue) {
  selectedCourse = newValue!; // Default to 'Select' if null
  notifyListeners();
}

  void updateUniversity(String newValue) {
    selectedUniversity = newValue;
    notifyListeners();
  }

  void updateQualification(String newValue) {
    selectedQualification = newValue;
    notifyListeners();
  }
}

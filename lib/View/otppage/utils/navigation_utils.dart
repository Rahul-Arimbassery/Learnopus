import 'package:flutter/material.dart';

class NavigationUtils {
  static void navigateToNextPage(PageController pageController, int currentPageIndex) {
    int nextPageIndex = (currentPageIndex + 1) % 2; // Toggle between 0 and 1
    pageController.animateToPage(
      nextPageIndex,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}

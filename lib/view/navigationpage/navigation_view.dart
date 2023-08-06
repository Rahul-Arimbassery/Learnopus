import 'package:flutter/material.dart';
import 'package:learnopus/view/splashscreen/splash_view.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _currentIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onTabTapped(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 62, 128, 208),
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 62, 128, 208),
            //title: const Text('Top Navigation Bar Example'),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0),
              child: Theme(
                data: Theme.of(context).copyWith(
                  canvasColor: const Color.fromARGB(255, 62, 128,
                      208), // Change the background color if needed
                ),
                child: BottomNavigationBar(
                  selectedItemColor: Colors.white,
                  unselectedItemColor: Colors.black,
                  elevation: 10,
                  currentIndex: _currentIndex,
                  onTap: _onTabTapped,
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.search),
                      label: 'Login',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.favorite),
                      label: 'Selection',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.settings),
                      label: 'University',
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: PageView(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            children: const [
              Splash(),
              //HomePage(),
              //OtpPage(),
              //ContentPage(),
              //UniversityPage(),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:learnopus/View/navigationpage/utils/navigation_utils.dart';
import '../../splashscreen/screen/splash_view.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;
    final PageController pageController = PageController(initialPage: 0);

    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 62, 128, 208),
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 62, 128, 208),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(25),
              child: Theme(
                data: Theme.of(context).copyWith(
                  canvasColor: const Color.fromARGB(255, 62, 128,
                      208), // Change the background color if needed
                ),
                child: BottomNavigationBar(
                  selectedItemColor: Colors.white,
                  unselectedItemColor: Colors.black,
                  elevation: 10,
                  currentIndex: currentIndex,
                  onTap: (index) => onTabTapped(context, index, pageController),
                  items: [
                    const BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Home',
                    ),
                    const BottomNavigationBarItem(
                      icon: Icon(Icons.search),
                      label: 'Login',
                    ),
                    const BottomNavigationBarItem(
                      icon: Icon(Icons.favorite),
                      label: 'Selection',
                    ),
                    BottomNavigationBarItem(
                      icon: IconButton(
                        onPressed: () => logout(context),
                        icon: const Icon(Icons.logout),
                      ),
                      label: 'University',
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: PageView(
            controller: pageController,
            onPageChanged: (index) =>
                onPageChanged(index, (value) => currentIndex = value),
            children: const [
              //ProfileEnterScreen(),
              Splash(),
              // HomePage(),
              // OtpPage(),
              // ContentPage(),
              // UniversityPage(),
            ],
          ),
        ),
      ),
    );
  }
}

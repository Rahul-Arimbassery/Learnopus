// import 'package:flutter/material.dart';
// import 'package:learnopus/View/navigationpage/utils/navigation_utils.dart';
// import 'package:learnopus/View/profile/screens/userprofile.dart';
// import 'package:learnopus/View/university/screens/universityhome.dart';
// import '../../splashscreen/screen/splash_view.dart';

// class NavigationPage extends StatelessWidget {
//   const NavigationPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     int currentIndex = 0;
//     final PageController pageController = PageController(initialPage: 0);

//     return MaterialApp(
//       home: SafeArea(
//         child: Scaffold(
//           backgroundColor: const Color.fromARGB(255, 62, 128, 208),
//           appBar: AppBar(
//             backgroundColor: const Color.fromARGB(255, 62, 128, 208),
//             bottom: PreferredSize(
//               preferredSize: const Size.fromHeight(25),
//               child: Theme(
//                 data: Theme.of(context).copyWith(
//                   canvasColor: const Color.fromARGB(255, 62, 128,
//                       208), // Change the background color if needed
//                 ),
//                 child: BottomNavigationBar(
//                   selectedItemColor: Color.fromARGB(255, 71, 245, 48),
//                   unselectedItemColor: const Color.fromARGB(255, 252, 251, 251),
//                   elevation: 10,
//                   currentIndex: currentIndex,
//                   onTap: (index) => onTabTapped(context, index, pageController),
//                   items: [
//                     const BottomNavigationBarItem(
//                       icon: Icon(Icons.home),
//                       label: 'Home',
//                     ),
//                     const BottomNavigationBarItem(
//                       icon: Icon(Icons.person),
//                       label: 'Login',
//                     ),
//                     const BottomNavigationBarItem(
//                       icon: Icon(Icons.school),
//                       label: 'Selection',
//                     ),
//                     BottomNavigationBarItem(
//                       icon: IconButton(
//                         onPressed: () => logout(context),
//                         icon: const Icon(Icons.logout),
//                       ),
//                       label: 'University',
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           body: PageView(
//             controller: pageController,
//             onPageChanged: (index) =>
//                 onPageChanged(index, (value) => currentIndex = value),
//             children:  [
//               const Splash(),
//               UserProfilePage(),
//               UniversityPage(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:learnopus/View/homepage/screens/homeview.dart';
import 'package:learnopus/View/postpage/screens/postui.dart';
import 'package:learnopus/View/profile/screens/userprofile.dart';
import 'package:learnopus/View/settingpage/screens/settings.dart';
import 'package:learnopus/View/university/screens/universityhome.dart';
import '../../splashscreen/screen/splash_view.dart';

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
      duration: const Duration(milliseconds: 500),
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
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0),
              child: Theme(
                data: Theme.of(context).copyWith(
                  canvasColor: const Color.fromARGB(255, 62, 128, 208), // Change the background color if needed
                ),
                child: BottomNavigationBar(
                  selectedItemColor: Colors.white,
                  unselectedItemColor: const Color.fromARGB(255, 2, 2, 2),
                  elevation: 10,
                  currentIndex: _currentIndex,
                  onTap: _onTabTapped,
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.school),
                      label: 'University',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.add_box),
                      label: 'Post',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person),
                      label: 'Profile',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.settings),
                      label: 'Settings',
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
              HomePage(),
              UniversityPage(),
              PostPage(),
              UserProfilePage(),
              SettingsItems(),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'screens/help.dart';
import 'screens/home.dart';
import 'screens/settings.dart';

class Route extends StatefulWidget {
  const Route({super.key});

  @override
  State<Route> createState() => _RouteState();
}

class _RouteState extends State<Route> {
  int currentTab = 0;

  List<Widget> pages = [
    // TestCloud(),
    const HomeScreen(),
    const HelpScreen(),
    const SettingView()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentTab],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black54,
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
        selectedItemColor: Colors.blue[900],
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
        currentIndex: currentTab,
        items: [
          //test
          // BottomNavigationBarItem(
          //     icon: const Icon(Icons.book),
          //     label: "Cashbook",
          //     activeIcon: Icon(
          //       Icons.book,
          //       color: Colors.blue[900],
          //     )),
          //home
          BottomNavigationBarItem(
              icon: const Icon(Icons.book),
              label: "Cashbook",
              activeIcon: Icon(
                Icons.book,
                color: Colors.blue[900],
              )),
          // body
          // BottomNavigationBarItem(
          //     icon: const Icon(Icons.bookmark_add_outlined),
          //     label: "Book",
          //     activeIcon: Icon(
          //       Icons.bookmark_add_outlined,
          //       color: Colors.blue[900],
          //     )),
          //help
          BottomNavigationBarItem(
              icon: const Icon(Icons.help_outline_outlined),
              label: "Help",
              activeIcon: Icon(
                Icons.help_outline_outlined,
                color: Colors.blue[900],
              )),
          //settings
          BottomNavigationBarItem(
              icon: const Icon(Icons.settings),
              label: "Settings",
              activeIcon: Icon(
                Icons.settings,
                color: Colors.blue[900],
              )),
        ],
        onTap: (value) {
          setState(() {
            currentTab = value;
          });
        },
      ),
    );
  }
}

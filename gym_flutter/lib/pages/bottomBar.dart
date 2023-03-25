import 'package:flutter/material.dart';

import 'package:gym_flutter/pages/mainScreen.dart';
import 'package:gym_flutter/pages/progress.dart';

class BottomBarApp extends StatefulWidget {
  const BottomBarApp({super.key});

  @override
  State<BottomBarApp> createState() => _BottomBarAppState();
}

class _BottomBarAppState extends State<BottomBarApp> {
  int _selectedIndex = 0;
  static final List _widgetOptions = [
    const MainScreen(),
    const ProgressPage(),
    const Text("Store Page"),
    const Text("Dots Page"),
  ];

  void _onItemtapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectedIndex],
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF71F1E3),
        onPressed: () {},
        child: const Icon(Icons.home_repair_service_outlined),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: _onItemtapped,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.grey,
              ),
              activeIcon: Icon(
                Icons.home_filled,
                color: Color(0xFF71F1E3),
                size: 30,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.signal_cellular_alt_rounded,
                  color: Colors.grey,
                ),
                activeIcon: Icon(
                  Icons.signal_cellular_alt_rounded,
                  color: Color(0xFF71F1E3),
                  size: 30,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.grey,
                ),
                activeIcon: Icon(
                  Icons.shopping_cart_rounded,
                  color: Color(0xFF71F1E3),
                  size: 30,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.more_horiz_rounded,
                  color: Colors.grey,
                ),
                activeIcon: Icon(
                  Icons.more_horiz_rounded,
                  color: Color(0xFF71F1E3),
                  size: 30,
                ),
                label: "Home"),
          ]),
    );
  }
}

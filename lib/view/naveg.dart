import 'package:flutter/material.dart';
import 'package:project_cook/view/menu.dart';

class Nav extends StatefulWidget {
  const Nav({super.key});

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  int selectedIndex = 0;
  List<Widget> pages = [
   const Menu(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: NavigationBar(
          shadowColor:const Color(0xFF0000001A),
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,

          backgroundColor: Colors.white,
          //  labelBehavior:NavigationDestinationLabelBehavior.
          animationDuration: const Duration(
            seconds: 4,
          ),
          indicatorColor: Color.fromARGB(255, 209, 209, 219),
          selectedIndex: selectedIndex,
          onDestinationSelected: (index) {
            setState(() {
              selectedIndex = index;
            });
          },

          destinations: const [
            NavigationDestination(
              icon: Icon(
                Icons.home,
                color: Color(0xFFED9728),
              ),
              label: 'Menu',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.account_circle_outlined,
                color: Color(0xFF979797),
              ),
              label: 'Profile',
            ),
          ],
        ),
        body: pages[selectedIndex],
      ),
    );
  }
}

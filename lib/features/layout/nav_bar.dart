import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:grade_project/features/chat/presintation/screen/chat_screen.dart';
import 'package:grade_project/features/home/presintation/screen/home_screen.dart';
import 'package:grade_project/features/profile/presintation/screen/profile_screen.dart';
import 'package:grade_project/features/search/presintation/screen/search_screen.dart';
import '../calendr/presintation/screen/calendar_screen.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int selectedPage = 0;

  final iconList = <IconData>[
    Icons.home_rounded,
    Icons.chat_bubble_outline_rounded,
    Icons.search_rounded,
    Icons.calendar_month_outlined,
    Icons.person_outline_rounded,
  ];

  final List<Widget> screens = [
    HomeScreen(userName: ''),
    ChatScreen(),
    SearchScreen(),
    CalendarScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedPage],

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,

      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        activeIndex: selectedPage,
        gapLocation: GapLocation.end,
        notchSmoothness: NotchSmoothness.defaultEdge,
        activeColor: Colors.blue,
        inactiveColor: Colors.grey,
        onTap: (index) {
          setState(() {
            selectedPage = index;
          });
        },
      ),
    );
  }
}
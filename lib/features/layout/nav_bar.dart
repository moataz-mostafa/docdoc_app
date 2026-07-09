import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:grade_project/core/helper/cach_helper.dart';
import 'package:grade_project/features/chat/presintation/screen/chat_screen.dart';
import 'package:grade_project/features/home/home/presintation/screen/home_screen.dart';
import 'package:grade_project/features/profile/presintation/screen/profile_screen.dart';
import '../calendr/presintation/screen/calendar_screen.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int selectedPage = 0;

  late final List<Widget> screens;

  @override
  void initState() {
    super.initState();

    screens = [

      const HomeScreen(),
      const ChatScreen(),
      const CalendarScreen(),
      const ProfileScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedPage,
        children: screens,
      ),
      bottomNavigationBar: CircleNavBar(
        activeIndex: selectedPage,

        onTap: (index) {
          setState(() {
            selectedPage = index;
          });
        },

        activeIcons: const [
          Icon(Icons.home_rounded, color: Colors.white),
          Icon(Icons.chat_bubble_rounded, color: Colors.white),
          Icon(Icons.calendar_month_rounded, color: Colors.white),
          Icon(Icons.person_rounded, color: Colors.white),
        ],

        inactiveIcons: const [
          Icon(Icons.home_outlined, color: Colors.grey),
          Icon(Icons.chat_bubble_outline, color: Colors.grey),
          Icon(Icons.calendar_month_outlined, color: Colors.grey),
          Icon(Icons.person_outline, color: Colors.grey),
        ],

        color: Colors.white,
        circleColor: Colors.blue,
        height: 60,
        circleWidth: 60,
        shadowColor: Colors.black26,
        elevation: 10,
        padding: EdgeInsets.zero,

        cornerRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
    );
  }
}
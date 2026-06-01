import 'package:flutter/material.dart';
import 'package:todo/screens/Home_Page.dart';
import 'package:todo/screens/settings_page.dart';

import 'Calendar_page.dart';
import 'File_page.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int selectedIndex = 0;

  final List<Widget> pages = [
    const HomePage(),
    CalendarPage(),
    FilePage(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],

      bottomNavigationBar: BottomMenuBar(
        selectedIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}

class BottomMenuBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const BottomMenuBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(28),
          topRight: Radius.circular(28),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 15,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: onTap,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent,
        elevation: 0,
        selectedItemColor: const Color(0xFF4A90E2),
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded, size: 35),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_rounded, size: 30),
            label: "Calendar",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insert_drive_file_outlined, size: 30),
            label: "Files",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_rounded, size: 30),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}

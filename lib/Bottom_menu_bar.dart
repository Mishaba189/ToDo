//bottom navigation bar used in home page (space to add 'add button' in the center)//

import 'package:flutter/material.dart';
import 'package:todo/Home_Page.dart';
import 'package:todo/Login_page.dart';
import 'package:todo/Settings_page.dart';

import 'Calendar_page.dart';
import 'File_page.dart';

class BottomMenuBar extends StatefulWidget {
  final int selectedIndex;
  const BottomMenuBar({super.key,this.selectedIndex = 0});

  @override
  State<BottomMenuBar> createState() => _BottomMenuBarState();
}

class _BottomMenuBarState extends State<BottomMenuBar> {
  late int _selectedindex;
  void initState() {
    super.initState();
    _selectedindex = widget.selectedIndex;
  }


  void _onItemTap(int index) {
    setState(() {
      _selectedindex = index;
      if(index ==0){
        Navigator.push(context,
            MaterialPageRoute(builder: (context)=>HomePage()));
      }
      if(index==1){
        Navigator.push(context,
            MaterialPageRoute(builder: (context)=>CalendarPage()));
      }
      if(index ==3){
        Navigator.push(context,
            MaterialPageRoute(builder: (context)=>FilePage()));
      }

      if(index ==4){
        Navigator.push(context,
            MaterialPageRoute(builder: (context)=>SettingsPage()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedindex,
      onTap: _onItemTap,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      elevation: 4,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home, size: 22),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_month, size: 22),
          label: 'Calendar',
        ),
        BottomNavigationBarItem(
            icon:Icon(Icons.circle,size: 10,color: Colors.white,),
          label: 'add'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.file_open_outlined, size: 22),
          label: 'Files',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings, size: 22),
          label: 'Settings',
        ),
      ],
    );

  }
}

//********************************************************************//
// Bottom Navigation Bar

class Bottomnavbar extends StatefulWidget {
  final int selectedIndex;
  const Bottomnavbar({super.key,this.selectedIndex = 0});

  @override
  State<Bottomnavbar> createState() => _BottomnavbarState();
}

class _BottomnavbarState extends State<Bottomnavbar> {
  late int _selectedindex;
  void initState() {
    super.initState();
    _selectedindex = widget.selectedIndex;
  }


  void _onItemTap(int index) {
    setState(() {
      _selectedindex = index;
      if(index ==0){
        Navigator.push(context,
            MaterialPageRoute(builder: (context)=>HomePage()));
      }
      if(index==1){
        Navigator.push(context,
            MaterialPageRoute(builder: (context)=>CalendarPage()));
      }
      if(index ==2){
        Navigator.push(context,
            MaterialPageRoute(builder: (context)=>FilePage()));
      }

      if(index ==3){
        Navigator.push(context,
            MaterialPageRoute(builder: (context)=>SettingsPage()));
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedindex,
      onTap: _onItemTap,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      elevation: 4,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home, size: 22),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_month, size: 22),
          label: 'Calendar',
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.file_open_outlined, size: 22),
          label: 'Files',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings, size: 22),
          label: 'Settings',
        ),
      ],
    );
  }
}


//*************************************end**********************************************//


import 'package:flutter/material.dart';

import 'Calendar_page.dart';
import 'File_page.dart';
import 'settings_page.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;

    final List<Map<String, dynamic>> gridItems = [
      {
        'title': 'Work',
        'icon': Icons.work_outline_rounded,
        'color': const Color(0xFF4A90E2),
      },
      {
        'title': 'Personal',
        'icon': Icons.person_outline_rounded,
        'color': const Color(0xFFFF9F43),
      },
      {
        'title': 'Shopping',
        'icon': Icons.shopping_bag_outlined,
        'color': const Color(0xFF00C48C),
      },
      {
        'title': 'Health',
        'icon': Icons.favorite_border_rounded,
        'color': const Color(0xFFFF5A5F),
      },
    ];

    final tasks = [
      {
        "title": "Finish Report",
        'time': '10:00 AM',
        'category': 'Work',
      },
      {
        "title": "Gym Workout",
        'time': '12:00 PM',
        'category': 'Health',
      },
      {
        "title": "Project Meeting",
        'time': '2:00 PM',
        'category': 'Work',
      },
      {
        "title": "Read Chapter 3",
        'time': '4:00 PM',
        'category': 'Personal',
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),


      floatingActionButton: FloatingActionButton(
        elevation: 4,
        backgroundColor: const Color(0xFF4A90E2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        onPressed: () {},
        child: const Icon(
          Icons.add,
          size: 30,
          color: Colors.white,
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

      bottomNavigationBar: const BottomMenuBar(selectedIndex: 0),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(height: h * 0.015),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Hello 👋",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Manage Your Tasks",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  Container(
                    height: 52,
                    width: 52,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(
                      Icons.notifications_none_rounded,
                      size: 28,
                    ),
                  ),
                ],
              ),

              SizedBox(height: h * 0.03),

              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding:
                    const EdgeInsets.symmetric(vertical: 18),
                    hintText: "Search tasks...",
                    hintStyle: TextStyle(
                      color: Colors.grey.shade500,
                    ),
                    prefixIcon: const Icon(
                      Icons.search_rounded,
                      size: 28,
                    ),
                  ),
                ),
              ),

              SizedBox(height: h * 0.03),

              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF4A90E2),
                      Color(0xFF5CA9FF),
                    ],
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Today's Progress",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "4/8 Tasks Completed",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.task_alt_rounded,
                        color: Colors.white,
                        size: 35,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: h * 0.03),
              const Text(
                "Categories",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: h * 0.02),

              GridView.builder(
                itemCount: gridItems.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                  childAspectRatio: 1.2,
                ),
                itemBuilder: (context, index) {
                  final item = gridItems[index];

                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.03),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(24),
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(18),
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: item['color']
                                    .withOpacity(0.15),
                                borderRadius:
                                BorderRadius.circular(14),
                              ),
                              child: Icon(
                                item['icon'],
                                color: item['color'],
                                size: 30,
                              ),
                            ),

                            Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item['title'],
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                const SizedBox(height: 4),

                                Text(
                                  "12 Tasks",
                                  style: TextStyle(
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),

              SizedBox(height: h * 0.03),

              Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Today's Tasks",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "See All",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: h * 0.01),

              ListView.builder(
                itemCount: tasks.length,
                shrinkWrap: true,
                physics:
                const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final task = tasks[index];

                  return Padding(
                    padding:
                    const EdgeInsets.only(bottom: 14),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                        BorderRadius.circular(22),
                        boxShadow: [
                          BoxShadow(
                            color:
                            Colors.black.withOpacity(0.03),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [

                          const CheckBox(),

                          const SizedBox(width: 14),

                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text(
                                  task['title']!,
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight:
                                    FontWeight.w600,
                                  ),
                                ),

                                const SizedBox(height: 6),

                                Text(
                                  task['category']!,
                                  style: TextStyle(
                                    color:
                                    Colors.grey.shade600,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          /// TIME
                          Container(
                            padding:
                            const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF1F5FF),
                              borderRadius:
                              BorderRadius.circular(12),
                            ),
                            child: Text(
                              task['time']!,
                              style: const TextStyle(
                                color: Color(0xFF4A90E2),
                                fontWeight:
                                FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),

              SizedBox(height: h * 0.12),
            ],
          ),
        ),
      ),

    );
  }
}


class CheckBox extends StatefulWidget {
  const CheckBox({super.key});

  @override
  State<CheckBox> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        height: 28,
        width: 28,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isChecked
              ? const Color(0xFF4A90E2)
              : Colors.transparent,
          border: Border.all(
            color: isChecked
                ? const Color(0xFF4A90E2)
                : Colors.grey.shade400,
            width: 2,
          ),
        ),
        child: isChecked
            ? const Icon(
          Icons.check,
          color: Colors.white,
          size: 18,
        )
            : null,
      ),
    );
  }
}


class BottomMenuBar extends StatefulWidget {
  final int selectedIndex;

  const BottomMenuBar({
    super.key,
    this.selectedIndex = 0,
  });

  @override
  State<BottomMenuBar> createState() =>
      _BottomMenuBarState();
}

class _BottomMenuBarState extends State<BottomMenuBar> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  void _onItemTapped(int index) {
    if (index == _selectedIndex) return;

    setState(() {
      _selectedIndex = index;
    });

    Widget page;

    switch (index) {
      case 0:
        page = const HomePage();
        break;

      case 1:
        page = CalendarPage();
        break;

      case 2:
        page = FilePage();
        break;

      case 3:
        page = const SettingsPage();
        break;

      default:
        return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 82,
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
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent,
        elevation: 0,
        selectedItemColor: const Color(0xFF4A90E2),
        unselectedItemColor: Colors.grey.shade500,
        showSelectedLabels: false,
        showUnselectedLabels: false,

        items: const [

          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded,size: 35,),
            label: "Home",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_rounded,size: 30,),
            label: "Calendar",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insert_drive_file_outlined,size: 30,),
            label: "Files",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.settings_rounded,size: 30,),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}


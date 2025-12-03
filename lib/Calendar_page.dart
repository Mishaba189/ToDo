import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo/Bottom_menu_bar.dart';

import 'Task_page.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  final List<Map<String, String>> tasks = [
    {'date': '16/09/2023', 'time': '9:45PM', 'title': 'Finish Report'},
    {'date': '16/09/2023', 'time': '10:00AM', 'title': 'Water the plants'},
  ];

  DateTime _focusedday = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(title: Text('Calender',
        style: TextStyle(color: Colors.blue,fontSize: 24,fontWeight: FontWeight.bold),),
        automaticallyImplyLeading: true,
      ),

      body:SingleChildScrollView(
        child: Padding(padding: EdgeInsets.symmetric(horizontal: 26),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TableCalendar(
                focusedDay: _focusedday,
                firstDay:DateTime.utc(2020, 12, 31),
                lastDay: DateTime.utc(2030, 1, 1),
                selectedDayPredicate: (day){
                  return isSameDay(_selectedDay,day);
                },
                onDaySelected: (selectedDay,focusedDay){
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedday = focusedDay;
                  });
                },
                headerStyle: HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true
                ),
                calendarStyle: CalendarStyle(
                    todayDecoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle
                    ),
                    selectedDecoration: BoxDecoration(
                        color: Color(0x88673AB7),
                        shape: BoxShape.circle
                    )
                ),
              ) ,
              SizedBox(
                height: screenHeight*0.05 ,
              ),
              SizedBox(
                height: 300,
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    final task = tasks[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFE3F2FD),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  task["date"]!,
                                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF2196F3),
                                  ),
                                ),
                                TextButton(onPressed: (){}, child: Text(
                                  'Delete',
                                  style: TextStyle(fontSize: 15, color: Colors.red[600], fontWeight: FontWeight.w500,
                                  ),
                                ),)
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              task['time']!,
                              style: const TextStyle(fontSize: 13, color: Colors.black54,),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              task['title']!,
                              style: const TextStyle(fontSize: 18, color: Colors.black87,),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

            ],
          ) ,
        ),
      ),
      bottomNavigationBar: BottomMenuBar(selectedIndex: 1),
      floatingActionButton: ElevatedButton(onPressed: (){
        Navigator.push(context,
            MaterialPageRoute(builder: (context)=>TaskPage()));
      },
          style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(20),
              backgroundColor:  Color(0xE42196F3),
              elevation: 5
          ),
          child: const Icon(Icons.add,size: 30,color: Colors.white,)
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      resizeToAvoidBottomInset: false,

    );
  }
}

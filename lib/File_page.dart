import 'package:flutter/material.dart';
import 'Bottom_menu_bar.dart';
import 'Task_page.dart';

class FilePage extends StatelessWidget {
  const FilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final overdueTasks = [
      {'title': 'Finish Report', 'subtitle': 'Thu, 7 Sept 2023'},
    ];
    final tasks = [
      {
        'title': 'Read Book',
      },
      {
        'title': 'Water Plants',
      },
      {
        'title': 'Walk the dogs',
      },
      {
        'title': 'Finish Report',
      },
      {
        'title': 'Finish Report',
      },
      {
        'title': 'Finish Report',
      },

    ];
    return Scaffold(
      appBar: AppBar(
        title:  Text('All tasks',textAlign: TextAlign.start,
            style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.blue)),
        automaticallyImplyLeading: true,
      ),
      body:SingleChildScrollView(
        child: Padding(padding: EdgeInsets.symmetric(horizontal: 26),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // SizedBox(height:screenHeight*0.05),

            SizedBox(height:screenHeight*0.03),
            Text('Overdue',textAlign: TextAlign.start,
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:Colors.red)),
            SizedBox(height:screenHeight*0.015),
            ListView.builder
              (
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: overdueTasks.length,
                itemBuilder: (context,index){
                  final task = overdueTasks[index];
              return Container(
                decoration: BoxDecoration(
                  color: Color(0x152196F3),
                  border: Border.all(
                    color:  Color(0x152196F3),
                  ),
                  borderRadius: BorderRadius.circular(8)
                ),
                child: ListTile(
                  leading:CheckButton(),
                  title: Text(tasks[index]['title']!),
                  subtitle: Text('Thur, 7 Sept 2023',style: TextStyle(color:Colors.red),),
                ),

              );
            }),
            SizedBox(height:screenHeight*0.03),
            Text('All tasks',textAlign: TextAlign.start,
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.blue),),
            SizedBox(height:screenHeight*0.015),
            ListView.builder(
              padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: tasks.length,
                itemBuilder: (context,index){
                  final task = tasks[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0x152196F3),
                          border: Border.all(
                              color:  Color(0x152196F3)
                          ),
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child: ListTile(
                        leading:CheckButton(),
                        title: Text(task['title']!),
                        subtitle: Text('Thur, 7 Sept 2023'),
                        // trailing: Text('10:2'),
                      ),
                    ),
                  );
                }
            ),
            Align(
              alignment:Alignment.centerRight,
              child:ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xE42196F3),
                  shape: CircleBorder(),
                  padding: EdgeInsetsGeometry.all(20),
                  elevation: 5
                ),
                  onPressed: (){},
                  child:const Icon(Icons.add,color: Colors.white,size: 30,)
              )
            )
          ],
        ),
        ),
      ),
      bottomNavigationBar: Bottomnavbar(selectedIndex: 2),
    );
  }
}

class CheckButton extends StatefulWidget {
  const CheckButton({super.key});

  @override
  State<CheckButton> createState() => _CheckButtonState();
}

class _CheckButtonState extends State<CheckButton> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
        });
      },
      child: Icon(
        isChecked ? Icons.check_box_outlined: Icons.check_box_outline_blank_rounded,
        color: isChecked ? Color(0xBE2196F3) : Color(0xBE2196F3),
        size: 30,
      ),
    );
  }
}
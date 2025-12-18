import 'package:flutter/material.dart';
import 'package:todo/Calendar_page.dart';
import 'package:todo/File_page.dart';
import 'package:todo/Home_Page.dart';

import 'Bottom_menu_bar.dart';

// import 'Bottom_menu_bar.dart';
class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.symmetric(horizontal: 26),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height:screenHeight*0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Add task',textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.blue),),
                TextButton(onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>HomePage()));
                }, child: Text('cancel',textAlign:TextAlign.end,
                  style:TextStyle(fontSize:14,fontWeight: FontWeight.normal,color: Colors.red ),))
              ],
            ),
            SizedBox(height:screenHeight*0.015),
            TextField(
              decoration:InputDecoration(
                border: OutlineInputBorder(
                    borderRadius:BorderRadius.circular(8),
                    // borderSide: BorderSide(color: Colors.white)
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0x1A2196F3))
                ),
                filled: true,
                fillColor: Color(0x1A2196F3),
                hintText: 'Finish Report',
              ),
            ),
            SizedBox(height:screenHeight*0.02),
            Text('Category',textAlign: TextAlign.start,
              style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.black),),
            SizedBox(height:screenHeight*0.015),
            TextField(
              decoration:InputDecoration(
                border: OutlineInputBorder(
                  borderRadius:BorderRadius.circular(8),
                  // borderSide: BorderSide(color: Colors.white)
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0x1A2196F3))
                ),
                filled: true,
                fillColor: Color(0x1A2196F3),
                hintText: 'Work',
                suffixIcon: Icon(Icons.keyboard_arrow_down_rounded,size:30,color:Color(0xFF605E5E) ,)
              ),
            ),
            SizedBox(height:screenHeight*0.02),
            Text('Date',textAlign: TextAlign.start,
              style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.black),),
            SizedBox(height:screenHeight*0.015),
            Column(
              children: [
                InkWell(
                  child: SizedBox(
                    height: screenHeight*0.04,
                    child: Row(
                      mainAxisAlignment:MainAxisAlignment.start,
                      children: [
                        Icon(Icons.calendar_month_outlined,size: 24,color: Colors.blue,),
                        SizedBox(width: screenWidth*0.03,),
                        Text('Set due date',style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color:Color(0xFF605E5E)),
                        )
                      ],
                    ),
                  ),
                  onTap: (){},
                ),
                SizedBox(height:screenHeight*0.01),
                InkWell(
                  child: SizedBox(
                    height: screenHeight*0.04,
                    child: Row(
                      mainAxisAlignment:MainAxisAlignment.start,
                      children: [
                        Icon(Icons.watch_later_outlined,size: 24,color: Colors.blue,),
                        SizedBox(width: screenWidth*0.03,),
                        Text('Set Time',style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color:Color(0xFF605E5E)),
                        )
                      ],
                    ),
                  ),
                  onTap: (){},
                ),
              ],
            ),
            SizedBox(height:screenHeight*0.02),
            Text('Reminder',textAlign: TextAlign.start,
              style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.black),),
            SizedBox(height:screenHeight*0.015),
            InkWell(
              child: SizedBox(
                height: screenHeight*0.04,
                child: Row(
                  mainAxisAlignment:MainAxisAlignment.start,
                  children: [
                    Icon(Icons.notifications_none,size: 24,color: Colors.blue,),
                    SizedBox(width: screenWidth*0.03,),
                    Text('Set Reminder',style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color:Color(0xFF605E5E)),
                    )
                  ],
                ),
              ),
              onTap: (){},
            ),
            SizedBox(height:screenHeight*0.02),
            Text('Notes',textAlign: TextAlign.start,
              style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.black),),
            SizedBox(height:screenHeight*0.015),
            Container(
              height:180,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xA2196F3),
                borderRadius: BorderRadius.circular(8)
              ),
              child: TextField(
                maxLines: null,
                expands: true,
                textAlignVertical: TextAlignVertical.top,
                decoration:InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius:BorderRadius.circular(8),
                    // borderSide: BorderSide(color: Colors.white)
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0x1A2196F3))
                  ),
                  filled: true,
                  fillColor: Color(0x1A2196F3),
                  hintText: 'Make sure to research from internet '
                ),
              ),
            ),
            SizedBox(height:screenHeight*0.015),
            Align(
              alignment:Alignment.centerRight,
              child: ElevatedButton(onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>HomePage()));
              },
                  style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: EdgeInsetsGeometry.all(20),
                      backgroundColor:  Color(0xE42196F3),
                      elevation: 5

                  ),
                  child:const Icon(Icons.check,size: 30,color: Colors.white,)),
            )
          ],
        ) ,
        )
      ),
      bottomNavigationBar: Bottomnavbar(selectedIndex: 0),

    );
  }
}


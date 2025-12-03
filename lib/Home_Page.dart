import 'package:flutter/material.dart';
import 'package:todo/Bottom_menu_bar.dart';
// import 'package:todo/File_page.dart';
import 'package:todo/Task_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override

  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final List<Map<String,dynamic>>gridItems =[
      {
        'title': 'Work',
        'icon' : Icons.work_outline,
        'color' : Colors.blue
      },
      {
        'title': 'Personal',
        'icon' : Icons.perm_identity,
        'color' : Colors.orange
      },
      {
        'title': 'Shopping',
        'icon' : Icons.shopping_cart_outlined,
        'color' : Colors.yellow
      },
      {
        'title': 'Health',
        'icon' : Icons.monitor_heart_outlined,
        'color' : Colors.red
      }

    ];
    final tasks =[
      {
        "title" : "Finish Report",
        'trailing': '10:00 am'
      },
      {
        "title" : "Gym Workout",
        'trailing': '12:00 pm'
      },
      {
        "title" : "Project Meeting",
        'trailing': '2:00 pm'
      },
      {
        "title" : "Read Chapter 3",
        'trailing': '4:00 pm'
      }

    ];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:  SizedBox(
         // width: screenWidth*0.9,
          child: TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8)
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.grey
                  )
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.grey
                  )
                ),
                filled: true,
                fillColor:  Color(0x202196F3),
                labelText: 'Search for Tasks, Events',
                prefixIcon: Icon(Icons.search,color: Color(0xFF787878),size: 25,)
            ),

          ),
        ),
      ),
      body:SingleChildScrollView( child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: screenHeight*0.03,
            ),
            Text('Categories',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
            SizedBox(height: screenHeight*0.02,),
            // SizedBox(
            //     height:screenHeight*0.25,
            //     width:screenWidth*0.9,
            //     child:Column( mainAxisAlignment: MainAxisAlignment.start,
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Row(
            //           children: [
            //             Expanded(child: TextButton(onPressed: (){},
            //                 style: TextButton.styleFrom(
            //                     backgroundColor: Color(0xF2196F3),
            //                     side: const BorderSide(color: Colors.blue),
            //                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)
            //                     ),
            //                     padding: (const EdgeInsets.symmetric(vertical: 35))
            //                 ),
            //                 child:Column(mainAxisAlignment: MainAxisAlignment.center,
            //                   children: [
            //                     Icon(Icons.work_outline,color: Colors.blue,size: 27,),
            //                     Text('Work',style:TextStyle(fontSize: 12 , fontWeight: FontWeight.normal),)
            //                   ],
            //                 )
            //             ),),
            //             SizedBox(width: 9,),
            //             Expanded(child: TextButton(onPressed: (){},
            //                 style: TextButton.styleFrom(
            //                     backgroundColor: Color(0x1B45DC01),
            //                     side: const BorderSide(color: Colors.green),
            //                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)
            //                     ),
            //                     padding: (const EdgeInsets.symmetric(vertical: 35))
            //                 ),
            //                 child:Column(mainAxisAlignment: MainAxisAlignment.center,
            //                   children: [
            //                     Icon(Icons.person,color:Colors.green,size: 27,),
            //                     Text('Personal',style:TextStyle(fontSize: 12 , fontWeight: FontWeight.normal),)
            //                   ],
            //                 )
            //             ),),
            //             SizedBox(width: 9,),
            //             Expanded(child: TextButton(onPressed: (){},
            //                 style: TextButton.styleFrom(
            //                     backgroundColor: Color(0x20F37505),
            //                     side: const BorderSide(color: Colors.orange),
            //                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)
            //                     ),
            //                     padding: (const EdgeInsets.symmetric(vertical: 35))
            //                 ),
            //                 child:Column(mainAxisAlignment: MainAxisAlignment.center,
            //                   children: [
            //                     Icon(Icons.shopping_cart,color:Colors.orange,size: 27,),
            //                     Text('Shopping',style:TextStyle(fontSize: 12 , fontWeight: FontWeight.normal),)
            //                   ],
            //                 )
            //             ))
            //           ],
            //         ),
            //         SizedBox(height: 9,),
            //         Expanded(child: TextButton(onPressed: (){},
            //             style: TextButton.styleFrom(
            //                 backgroundColor: Color(0x20FB0510),
            //                 side: const BorderSide(color: Colors.red),
            //                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)
            //                 ),
            //                 padding: (const EdgeInsets.symmetric(horizontal: 46,))
            //             ),
            //             child:Column(mainAxisAlignment: MainAxisAlignment.center,
            //               children: [
            //                 Icon(Icons.monitor_heart_rounded,color: Colors.red,size: 27,),
            //                 Text('Health',style:TextStyle(fontSize: 12 , fontWeight: FontWeight.normal),)
            //               ],
            //             )
            //         ))
            //       ],
            //     )
            // ),
            GridView.count(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              crossAxisCount: 3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              children: List.generate(gridItems.length, (index) {
                return TextButton(
                  onPressed: () {
                    print('Tapped: ${gridItems[index]['title']}');
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: gridItems[index]['color'].withOpacity(0.15),
                    side: BorderSide(color: gridItems[index]['color']),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 35),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(gridItems[index]['icon'], color: gridItems[index]['color'], size: 27),
                      const SizedBox(height: 8),
                      Text(
                        gridItems[index]['title'],
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: gridItems[index]['color'],
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),

            // SizedBox(height: screenHeight*0.02,),
            Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Today’s task',textAlign: TextAlign.start,
                  style:TextStyle(fontSize: 20,fontWeight:FontWeight.bold ,color: Colors.black),),
                TextButton(onPressed: (){}, child:Text('See All',textAlign: TextAlign.end,
                  style:TextStyle(fontSize: 14,fontWeight: FontWeight.normal,color: Colors.blue) ,))

              ],
            ),
            // SizedBox(height: screenHeight*0.02,),
            // Container(
            //   height: screenHeight*0.065,
            //   decoration:BoxDecoration(
            //       color: Color(0x1A03A9F4),
            //     border: Border.all(color: Color(0xFF8E8D8D),width: 1),
            //     borderRadius: BorderRadius.circular(8)
            //   ),
            //   child: checkbutton(),
            // ),
            // SizedBox(height: screenHeight*0.03,),
            // Container(
            //   height: screenHeight*0.065,
            //   decoration:BoxDecoration(
            //       color: Color(0x1A03A9F4),
            //       border: Border.all(color: Color(0xFF8E8D8D),width: 1),
            //       borderRadius: BorderRadius.circular(8)
            //   ),
            //   child: checkbutton2(),
            // ),
            // SizedBox(height: screenHeight*0.03,),
            // Container(
            //   height: screenHeight*0.065,
            //   decoration:BoxDecoration(
            //       color: Color(0x1A03A9F4),
            //       border: Border.all(color: Color(0xFF8E8D8D),width: 1),
            //       borderRadius: BorderRadius.circular(8)
            //   ),
            //   child: checkbutton3(),
            // ),
            // SizedBox(height: screenHeight*0.03,),
            // Container(
            //   height: screenHeight*0.065,
            //   decoration:BoxDecoration(
            //       color: Color(0x1A03A9F4),
            //       border: Border.all(color: Color(0xFF8E8D8D),width: 1),
            //       borderRadius: BorderRadius.circular(8)
            //   ),
            //   child: checkbutton4(),
            // ),
            ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
                physics: NeverScrollableScrollPhysics(),
                itemCount: tasks.length,
                itemBuilder: (context,index){
                  final task = tasks[index];
                  return Padding(padding: EdgeInsets.symmetric(vertical: 13),
                  child: Container(
                    height: 70,
                    decoration: BoxDecoration(
                      color: Color(0x152196F3),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Color(0x152196F3),
                      )
                    ),
                    child:Align(
                      alignment: Alignment.center,
                      child:  ListTile(
                        leading:Checkbuttoncircl(),
                        title: Text(tasks[index]['title']!),
                        trailing:Text(tasks[index]['trailing']!) ,
                      ),
                    )
                  )
                  );
                },
            ),

            SizedBox(height: screenHeight*0.004,),

          ],
          ),
          )
        ],
      ),
      ),
      bottomNavigationBar: BottomMenuBar(selectedIndex: 0,),
      floatingActionButton: ElevatedButton(onPressed: (){
        Navigator.push(context,
            MaterialPageRoute(builder: (context)=>TaskPage()));
      },
          style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(20),
              //foregroundColor: Color(0x282196F3),
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
class Checkbuttoncircl extends StatefulWidget {
  const Checkbuttoncircl({super.key});

  @override
  State<Checkbuttoncircl> createState() => _CheckbuttoncirclState();
}

class _CheckbuttoncirclState extends State<Checkbuttoncircl> {
  bool ischecked = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          ischecked = !ischecked;
        }
        );
      },
      child: Icon(
        ischecked ? Icons.check_circle : Icons.circle_outlined,
        color: ischecked ? Colors.blue : Colors.grey,
        size: 30,
      ),
    );
  }
}


//******************************************************************************//
// // tasks box content with checkmark button
// //task1
// class checkbutton extends StatefulWidget {
//   const checkbutton({super.key});
//
//   @override
//   State<checkbutton> createState() => _tickbuttonState();
// }
//
// class _tickbuttonState extends State<checkbutton> {
//   bool _istaped = true;
//   @override
//   Widget build(BuildContext context) {
//
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [ Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [ IconButton(onPressed: (){
//           setState(() {
//             _istaped = !_istaped;
//           });
//         },
//           icon:Icon(
//             _istaped ? Icons.circle_outlined : Icons.check_circle,
//             color: _istaped ? Colors.grey : Colors.blue,
//           ),
//           iconSize: 23,
//         ),
//           Text('Finish Report',textAlign: TextAlign.start,
//             style:TextStyle(fontSize: 16,fontWeight: FontWeight.normal,color: Color(
//                 0x8B000000)),),
//         ],
//       ),
//         Text('10:00 am  ',style: TextStyle(fontSize: 14,color: Color(0x8B000000),fontWeight: FontWeight.normal),)
//       ],
//     );
//   }
// }
// //*************************************************************************//
// //task2
// class checkbutton2 extends StatefulWidget {
//   const checkbutton2({super.key});
//
//   @override
//   State<checkbutton2> createState() => _checkbutton2State();
// }
//
// class _checkbutton2State extends State<checkbutton2> {
//   bool _istaped = true;
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [ Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [ IconButton(onPressed: (){
//           setState(() {
//             _istaped = !_istaped;
//           });
//         },
//           icon:Icon(
//             _istaped ? Icons.circle_outlined : Icons.check_circle,
//             color: _istaped ? Colors.grey : Colors.blue,
//           ),
//           iconSize: 23,
//         ),
//           Text('Gym Workout',textAlign: TextAlign.start,
//             style:TextStyle(fontSize: 16,fontWeight: FontWeight.normal,color: Color(
//                 0x8B000000)),),
//         ],
//       ),
//         Text('12:00 pm  ',style: TextStyle(fontSize: 14,color: Color(0x8B000000),fontWeight: FontWeight.normal),)
//       ],
//     );
//   }
// }
// //***********************************************************************************//
// //task3
// class checkbutton3 extends StatefulWidget {
//   const checkbutton3({super.key});
//
//   @override
//   State<checkbutton3> createState() => _checkbutton3State();
// }
//
// class _checkbutton3State extends State<checkbutton3> {
//   bool _istaped = true;
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [ Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [ IconButton(onPressed: (){
//           setState(() {
//             _istaped = !_istaped;
//           });
//         },
//           icon:Icon(
//             _istaped ? Icons.circle_outlined : Icons.check_circle,
//             color: _istaped ? Colors.grey : Colors.blue,
//           ),
//           iconSize: 23,
//         ),
//           Text('Project Meeting',textAlign: TextAlign.start,
//             style:TextStyle(fontSize: 16,fontWeight: FontWeight.normal,color: Color(
//                 0x8B000000)),),
//         ],
//       ),
//         Text('2:00 am  ',style: TextStyle(fontSize: 14,color: Color(0x8B000000),fontWeight: FontWeight.normal),)
//       ],
//     );
//   }
// }
//
// //********************************************************************************//
// //task4
// class checkbutton4 extends StatefulWidget {
//   const checkbutton4({super.key});
//
//   @override
//   State<checkbutton4> createState() => _checkbutton4State();
// }
//
// class _checkbutton4State extends State<checkbutton4> {
//   bool _istaped = true;
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [ Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [ IconButton(onPressed: (){
//           setState(() {
//             _istaped = !_istaped;
//           });
//         },
//           icon:Icon(
//             _istaped ? Icons.circle_outlined : Icons.check_circle,
//             color: _istaped ? Colors.grey : Colors.blue,
//           ),
//           iconSize: 23,
//         ),
//           Text('Read Chapter 3',textAlign: TextAlign.start,
//             style:TextStyle(fontSize: 16,fontWeight: FontWeight.normal,color: Color(
//                 0x8B000000)),),
//         ],
//       ),
//         Text('4:00 am  ',style: TextStyle(fontSize: 14,color: Color(0x8B000000),fontWeight: FontWeight.normal),)
//       ],
//     );
//   }
// }
//
//*************************************end**********************************************//
import 'package:flutter/material.dart';
import 'package:todo/Registration_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column( mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height:screenHeight*0.15,),
             Image(image:AssetImage('assets/images/ToDo1.png'),height: 291,width: 291),
             SizedBox(height:screenHeight*0.09),
             Padding(padding: EdgeInsets.symmetric(horizontal: 36),
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.stretch,
               children: [
                 RichText( textAlign: TextAlign.center,
                   text: TextSpan(
                       children: [
                         TextSpan(
                             text: 'Simplify,Organize,and Conquer',
                             style: (TextStyle(fontSize: 34,fontWeight: FontWeight.bold,color: Colors.black))
                         ),
                         TextSpan(
                             text: 'Your Day',
                             style: (TextStyle(fontSize: 34,fontWeight: FontWeight.bold,color: Colors.blueAccent))
                         )
                       ]
                   ),
                 ),
                 SizedBox(height:screenHeight*0.02,),
                 Padding(padding: EdgeInsets.symmetric(horizontal: 30),
                   child: Text('Take control of your tasks and achieve your goals.', textAlign: TextAlign.center,
                     style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal,color: Colors.black),),
                 ),
                 SizedBox(height:screenHeight*0.11,),
                 ElevatedButton(onPressed: (){
                   Navigator.push(
                     context,
                     MaterialPageRoute(builder: (context) => RegistrationPage()),
                   );

                 },
                     style: ElevatedButton.styleFrom(
                         backgroundColor: Colors.blue,
                         padding: const EdgeInsets.symmetric(vertical:14,horizontal: 10)
                     ),
                     child:const Text('Lets Start',
                       style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),)
                 )
               ],
             ),)

          ],
        ),
      ),
    );
  }
}

//*************************************end**********************************************//

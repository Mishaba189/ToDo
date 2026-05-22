import 'package:flutter/material.dart';
class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 36),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight*.14,),
              Text('Forgot Password?',textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,color: Colors.black)),
              SizedBox(height:screenHeight*0.065,),


            ],
          ),
        ),
      ),
    );
  }
}

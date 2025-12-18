import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/Home_Page.dart';
import 'package:todo/Providers/Provider_auth.dart';
import 'package:todo/Registration_page.dart';
import 'package:todo/Reset_password.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final logprovider = context.read<ProviderAuth>();
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsetsGeometry.symmetric(horizontal: 36),
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: screenHeight*.14,),
              Text('Welcome Back',textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,color: Colors.black)),
              SizedBox(height:screenHeight*0.065,),
              Text('Login',textAlign: TextAlign.start,
                style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.blueAccent)),
              SizedBox(height:screenHeight*0.015,),
              Row(mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.email_outlined,color: Colors.black,size: 15,),
                SizedBox(width:screenWidth*0.008,),
                Text('Your email',
                  style: TextStyle(fontWeight: FontWeight.normal,fontSize: 10,color: Colors.black),)
              ],
              ),
              SizedBox(height:screenHeight*0.008,),
              TextField(
                controller: logprovider.inputEmail,
                decoration: InputDecoration(
                  errorText: logprovider.inEmailError,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15)
                  ),
                  //labelText: 'email'
                ),

              ),
              SizedBox(height:screenHeight*0.027,),
              Row(mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.lock_outline_rounded,color: Colors.black,size:15 ,),
                  SizedBox(width:screenWidth*0.008,),
                  Text('Your Password',
                    style: TextStyle(color: Colors.black,fontSize: 10,fontWeight: FontWeight.normal),)
                ],
              ),
              SizedBox(height:screenHeight*0.008,),
              Consumer<ProviderAuth>(
                  builder: (context, logProvider, child) {
                    return PasswordField(
                      isObscure: !logProvider.isPasswordVisible,
                      onToggle: logProvider.togglePasswordVisibility,
                      onChanged: logProvider.setInPassword,
                      ErrorText: logProvider.inPasswordError,
                    );
                  }

              ),
              SizedBox(height:screenHeight*0.032,),
              TextButton(onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>ResetPassword()),
                );
              },
                  child:Text ('Forgot Password?',textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold,fontSize: 15),)
              ),
              SizedBox(height:screenHeight*0.04,),
              SizedBox(
                height:screenHeight*0.052 ,
                width:screenWidth*0.0349 ,
                child: ElevatedButton(onPressed:(){
                  final isValid = context.read<ProviderAuth>().login();
                  if (isValid) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                    logprovider.clearFields();
                  } else {
                    final p = context.read<ProviderAuth>();
                    if(p.inEmailError== 'User not found' || p.inPasswordError == 'Incorrect password'){
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Invalid credentials')),
                      );
                    }
                 }
                } ,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent
                    ),
                    child:Text('Login',textAlign: TextAlign.center,
                      style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,color: Colors.white ),)),
              ),
              SizedBox(height:screenHeight*0.013,),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Dont have an account?',
                    style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.normal),
                  ),
                  TextButton(onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>RegistrationPage()));
                  },
                      child: Text('Sign up',style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Colors.blueAccent),))
                ],
              ),
              SizedBox(height:screenHeight*0.08 ,),
              Text('OR',textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal,color: Colors.black),
              ),
              SizedBox(height:screenHeight*0.005,),
              Container(
                height:screenHeight*0.001,
                color: CupertinoColors.systemGrey,
              ),
              SizedBox(height:screenHeight*0.025,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(onPressed: (){context.read<ProviderAuth>().openGoogle();},
                      icon:Image.asset('assets/images/google.png',height:43 ,width: 43,)
                  ),
                  IconButton(onPressed: (){context.read<ProviderAuth>().openFacebook();}, icon: Icon(Icons.facebook,color: Colors.blue,size: 51,),
                  ),
                  IconButton(
                    icon: Image.asset('assets/images/instagramlogo.png',height: 43,width: 43,),
                    onPressed: () {context.read<ProviderAuth>().openInstagram();},
                  ),

                ],
              ),

            ],
          ),
        ),

      ),

    );
  }
}

//*************************************end**********************************************//

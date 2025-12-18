import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/Login_page.dart';
import 'package:todo/Providers/Provider_auth.dart';


class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final regProvider = context.read<ProviderAuth>();
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.symmetric(horizontal: 36 ),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: screenHeight*0.11,),
              Text('Create Account',textAlign: TextAlign.center,
                style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,color: Colors.black),
              ),
              SizedBox(height:screenHeight*0.06,),
              Text('Sign up',textAlign: TextAlign.start,
                style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.blue),),
              SizedBox(height: screenHeight*0.02,),
              Row(
                children:[
                  Icon(Icons.account_circle_outlined,color: Colors.black,size: 15,),
                  SizedBox(width:screenWidth*0.008,),
                  Text('Your Username',style: TextStyle(fontSize: 10,color: Colors.black),)
                ],
              ),
              SizedBox(height:screenHeight*0.008,),
              TextField(
                controller:regProvider.name,
                decoration: InputDecoration(
                  errorText: regProvider.nameError,
                 // labelText: 'Username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15)
                  )
                ),
              ),
              SizedBox(height:screenHeight*0.034,),
              Row(
                children: [
                  Icon(Icons.email_outlined,color: Colors.black,size: 15,),
                  SizedBox(width:screenWidth*0.008,),
                  Text('Your email',style: TextStyle(fontSize: 10,color: Colors.black),)
                ],
              ),
              SizedBox(height:screenHeight*0.008,),
              TextField(
                controller: regProvider.email,
                decoration: InputDecoration(
                  errorText: regProvider.emailError,
                  //labelText: 'email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15)
                  )
                ),
              ),
              SizedBox(height:screenHeight*0.034,),
              Row(
                children: [
                  Icon(Icons.lock_outline_rounded,color: Colors.black,size: 15,),
                  SizedBox(width:screenWidth*0.008,),
                  Text('Password',style: TextStyle(fontSize: 10,color: Colors.black),)
                ],
              ),
              SizedBox(height:screenHeight*0.008,),
              Consumer<ProviderAuth>(
                builder: (context, regProvider, child) {
                  return PasswordField(
                    isObscure: !regProvider.isPasswordVisible,
                    onChanged: regProvider.setPassword,
                    onToggle: regProvider.togglePasswordVisibility,
                    ErrorText: regProvider.passwordError,
                  );
                },
              ),

              SizedBox(height:screenHeight*0.08,),
              SizedBox(
                height:screenHeight*0.052,
                width:screenWidth*0.0349,
                child: ElevatedButton(onPressed: (){
                  final isValid= regProvider.validateForm();
                  if(isValid){
                    regProvider.registration();
                    regProvider.clearFields();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>LoginPage()),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Registered'),duration: Duration(seconds: 1),)
                    );

                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Fill all the fields'),
                      ),
                    );
                  }

                },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                    ),
                    child: Text('Sign Up', style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold,
                        color: Colors.white),
                    )
                ),
              ),
              SizedBox(height:screenHeight*0.020,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text( 'Already a user?',
                    style: TextStyle(color: Colors.black,fontSize: 15,fontWeight:FontWeight.normal)),
                  TextButton(onPressed:(){
                    Navigator.push(
                      context, MaterialPageRoute(builder: (context) =>LoginPage())
                    );
                  } , child:Text('Sign In',
                  style: TextStyle(color: Colors.blue,fontSize: 15,fontWeight: FontWeight.normal )))
                ]
              ),
              SizedBox(height:screenHeight*0.040,),

              Text('OR',textAlign: TextAlign.center,
                style:TextStyle(fontSize: 20,fontWeight: FontWeight.normal,color: Colors.black) ,),
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
                  IconButton(onPressed:(){ context.read<ProviderAuth>().openFacebook();}, icon: Icon(Icons.facebook,color: Colors.blue,size: 51,),
                  ),
                  IconButton(
                    icon: Image.asset('assets/images/instagramlogo.png',height: 43,width: 43,),
                    onPressed: () {context.read<ProviderAuth>().openInstagram();},
                  ),

                ],
              )
            ],
          ) ,
        ),
      ),

    );
  }
}

//password field input box with boarder//

class PasswordField extends StatelessWidget {
  final bool isObscure;
  final VoidCallback onToggle;
  final ValueChanged<String> onChanged;
  final String ? ErrorText;

  const PasswordField({
    super.key,
    required this.isObscure,
    required this.onToggle,
    required this.onChanged,
    this.ErrorText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isObscure,
      onChanged: onChanged,
      decoration: InputDecoration(
        errorText: ErrorText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            isObscure ? Icons.visibility_off : Icons.visibility,
          ),
          onPressed: onToggle,
        ),
      ),
    );
  }
}


//*************************************end**********************************************//


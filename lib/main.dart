import 'package:flutter/material.dart';
import 'package:todo/Welcome_page.dart';
import 'package:todo/Registration_page.dart';
import 'package:todo/Login_page.dart';

import 'Settings_page.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:WelcomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}




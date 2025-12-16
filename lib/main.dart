import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/Providers/Provider_auth.dart';
import 'package:todo/Welcome_page.dart';

void main(){
  runApp(MultiProvider(providers: [
   ChangeNotifierProvider(create: (_)=>ProviderAuth())

  ],
  child: const MyApp(),
  ));

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




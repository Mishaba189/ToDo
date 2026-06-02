import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:todo/Providers/Provider_auth.dart';
import 'package:todo/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(
      MultiProvider(
    providers: [
   ChangeNotifierProvider(create: (_)=>AuthProvider())
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




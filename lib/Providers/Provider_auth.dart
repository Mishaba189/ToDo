import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AuthProvider extends ChangeNotifier{

  bool isPasswordVisible= false;
  void togglePasswordVisibility(){
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }







  @override
  void dispose(){
    super.dispose();

  }

}
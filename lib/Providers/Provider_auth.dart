import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier{
  bool isLogin = true;

  bool isPasswordVisible= false;
  void togglePasswordVisibility(){
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

  void toggleAuthMode() {
    isLogin = !isLogin;
    notifyListeners();
  }



  @override
  void dispose(){
    super.dispose();

  }

}
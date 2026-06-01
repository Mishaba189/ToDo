import 'package:flutter/material.dart';
import 'package:todo/services/auth_services.dart';

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
  TextEditingController userName = TextEditingController();
  TextEditingController userEmail = TextEditingController();
  TextEditingController password = TextEditingController();

  String ? error;



  Future<bool>register (String email, String password)async{
    final AuthServices authServices = AuthServices();
    try {
      error = null;
      await authServices.register(email, password);
      notifyListeners();
      return true;

    } catch (e) {
    error= authServices.getReadableError(e);
    notifyListeners();
    return false;

    }
  }


  clearAll(){
    userEmail.clear();
    userName.clear();
    password.clear();
  }










  @override
  void dispose(){
    userEmail.dispose();
    userName.dispose();
    password.dispose();
    super.dispose();

  }

}
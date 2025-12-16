import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProviderAuth extends ChangeNotifier{
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController inputEmail = TextEditingController();
  String password = '';
  String inputPassword = '';
  String ? nameError;
  String ? emailError;
  String ? passwordError;
  String ? inEmailError;
  String ? inPasswordError;
  bool isPasswordVisible= false;
  //registration validation
  void validateName(){
    if(name.text.trim().isEmpty){
      nameError= 'Username is required';
    }else{
      nameError = null;
    }
    notifyListeners();
  }
  void validateEmail(){
    if(email.text.trim().isEmpty){
      emailError = 'Email is required';
    }else{
      emailError= null;
    }
    notifyListeners();
  }
  void setPassword(String value){
    password = value;
    if(password.isEmpty){
      passwordError = 'Password is required';
    }else if(password.length <8){
      passwordError='Password must be at least 8 characters';
    }else{
      passwordError=null;
    }
    notifyListeners();
  }
  bool validateForm(){
    validateName();
    validateEmail();
    setPassword(password);
    return nameError == null && emailError == null && passwordError== null;

  }
  //password toggle
  void togglePasswordVisibility(){
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }
  //testing printing
  void registration() {
    if(validateForm()){
      debugPrint(name.text);
      debugPrint(email.text);
      debugPrint(password);
    }else{
      debugPrint('Form is not valid');
    }
  }
  // clearing fields
  void clearFields(){
    name.clear();
    email.clear();
    password= '';
    notifyListeners();
  }
  //social media opening
  Future<void> openFacebook() async {
    await _openWeb('https://www.facebook.com');
  }
  Future<void> openInstagram() async {
    await _openWeb('https://www.instagram.com');
  }
  Future<void> openTwitter() async{
    await _openWeb('https://twitter.com');
  }
  Future<void> _openWeb(String url) async {
    final Uri uri = Uri.parse(url);
    await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );
  }


  // login validation
  void validateUserEmail(){
    if(inputEmail.text.trim().isEmpty){
      inEmailError = 'Email is required';
    }else{
      inEmailError = null;
    }
    notifyListeners();
  }
  void setInPassword(String value) {
    inputPassword = value;

    if (inputPassword.isEmpty) {
      inPasswordError = 'Password is required';
    } else if (inputPassword.length < 8) {
      inPasswordError = 'Password must be at least 8 characters';
    } else {
      inPasswordError = null;
    }
    notifyListeners();
  }
  bool validateLoginForm() {
    validateUserEmail();
    setInPassword(inputPassword);

    return inEmailError == null && inPasswordError == null;
  }

  void logins(){
    debugPrint(inputEmail.text);
    debugPrint(inputPassword);

  }

@override
  void dispose(){
    name.dispose();
    email.dispose();
    super.dispose();
    inputEmail.dispose();
}

}
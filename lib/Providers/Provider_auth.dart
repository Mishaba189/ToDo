import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProviderAuth extends ChangeNotifier{
  //controllers
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController inputEmail = TextEditingController();
  //values
  String password = '';
  String inputPassword = '';
  //errors
  String ? nameError;
  String ? emailError;
  String ? passwordError;
  String ? inEmailError;
  String ? inPasswordError;
  //
  String ? registeredEmail;
  String ? registeredPassword;
  //states
  bool isPasswordVisible= false;
  bool hasSubmitted =false;
  //users store
  List<Map<String,String>>users =[];

  //register

  //password toggle
  void togglePasswordVisibility(){
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

  //name validation
  void validateName(){
    if(name.text.trim().isEmpty){
      nameError= 'Username is required';
    }else{
      nameError = null;
    }
    notifyListeners();
  }
  //email validation
  void validateEmail(){
    if(email.text.trim().isEmpty){
      emailError = 'Email is required';
    }else{
      emailError= null;
    }
    notifyListeners();
  }
  //password validation
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
  //registration validation
  bool validateForm(){
    validateName();
    validateEmail();
    setPassword(password);
    return nameError == null && emailError == null && passwordError== null;
  }

  //registration

  void debugPrintAllUsers() {
    debugPrint('----- REGISTERED USERS -----');

    for (int i = 0; i < users.length; i++) {
      debugPrint(
        'User ${i + 1}: '
            'Name: ${users[i]['name']}, '
            'Email: ${users[i]['email']}, '
            'Password: ${users[i]['password']}',
      );
    }

    debugPrint('----------------------------');
  }
  void registration() {
    if (!validateForm()) return;

    final emailExists =
    users.any((u) => u['email'] == email.text.trim());

    if (emailExists) {
      emailError = 'Email already registered';
      notifyListeners();
      return;
    }

    users.add({
      'name': name.text.trim(),
      'email': email.text.trim(),
      'password': password,
    });

    debugPrintAllUsers();
    clearFields();
  }
  // clearing fields
  void clearFields(){
    name.clear();
    email.clear();
    password= '';
    inputEmail.clear();
    inputPassword = '';
    notifyListeners();
  }
  //social media opening
  Future<void> openFacebook() async {
    await _openWeb('https://www.facebook.com');
  }
  Future<void> openInstagram() async {
    await _openWeb('https://www.instagram.com');
  }
  Future<void> openGoogle() async{
    await _openWeb('https://google.com');
  }
  Future<void> _openWeb(String url) async {
    final Uri uri = Uri.parse(url);
    await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );
  }


  //login


  // login validation

  bool validateLoginForm() {
    hasSubmitted = true;
    inEmailError = null;
    inPasswordError= null;

    final emailText = inputEmail.text.trim();
    final passwordText = inputPassword;

    if(emailText.isEmpty){
      inEmailError='Email is required';
    }
    if(passwordText.isEmpty){
      inPasswordError = 'Password is required';
    }
    if(inEmailError!=null&& inPasswordError!=null){
      notifyListeners();
      return false;
    }
    //user find
    final user = users.firstWhere(
        (u) => u["email"] == emailText,
      orElse: () => {},
    );
    if(user.isEmpty){
      inEmailError = 'User not found';
      notifyListeners();
      return false;
    }
    if(user["password"]!= passwordText){
      inPasswordError= 'Incorrect password';
      notifyListeners();
      return false;
    }
    notifyListeners();
    return  true;
  }
  bool login (){
    return validateLoginForm();
  }
  void setInPassword(String value) {
    inputPassword = value;
    if (hasSubmitted) {
      validatePassword();
    }
  }
  void validatePassword() {
    if (inputPassword.isEmpty) {
      inPasswordError = 'Password is required';
    } else if (inputPassword.length < 8) {
      inPasswordError = 'Password must be at least 8 characters';
    } else {
      inPasswordError = null;
    }
  }


  void logins(){
    if (validateLoginForm()){
      debugPrint(inputEmail.text);
      debugPrint(inputPassword);
    }else{
      debugPrint('Login failed');
    }
  }

@override
  void dispose(){
    name.dispose();
    email.dispose();
    inputEmail.dispose();
    super.dispose();

}

}
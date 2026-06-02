import 'package:flutter/material.dart';
import 'package:todo/services/auth_services.dart';
import 'package:todo/services/user_services.dart';

class AuthProvider extends ChangeNotifier {

  // UI State
  bool isLogin = true;
  bool isPasswordVisible = false;
  bool isLoading = false;
  String? error;
  bool resetLinkSent = false;
  bool isSendingResetLink = false;

  // Controllers
  TextEditingController userName = TextEditingController();
  TextEditingController userEmail = TextEditingController();
  TextEditingController password = TextEditingController();

  // Services
  final AuthServices authServices = AuthServices();
  final UserServices userServices = UserServices();

  // Toggle Password Visibility
  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

  // Toggle Login / Signup
  void toggleAuthMode() {
    isLogin = !isLogin;
    notifyListeners();
  }

  // Register
  Future<bool> register(
      String email,
      String password,
      String name,
      ) async {
    try {
      isLoading = true;
      error = null;

      final user = await authServices.register(email, password);
      await userServices.saveUserData(user.uid, name, email);

      notifyListeners();
      return true;
    } catch (e) {
      error = authServices.getReadableError(e);
      notifyListeners();
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // Login
  Future<bool> login(
      String email,
      String password,
      ) async {
    try {
      await authServices.login(email, password);
      return true;
    } catch (e) {
      error = authServices.getReadableError(e);
      notifyListeners();
      return false;
    }
  }

  //Reset password

  Future<bool> resetPassword(String email) async {
    try {
      isSendingResetLink = true;
      notifyListeners();

      await userServices.checkEmail(email);
      await authServices.resetPassword(email);

      resetLinkSent = true;

      isSendingResetLink = false;
      notifyListeners();

      return true;
    } catch (e) {
      isSendingResetLink = false;
      error = e.toString().replaceFirst('Exception: ', '');
      notifyListeners();
      return false;
    }
  }

  // Clear Fields
  void clearAll() {
    userEmail.clear();
    userName.clear();
    password.clear();
    notifyListeners();
  }

  @override
  void dispose() {
    userEmail.dispose();
    userName.dispose();
    password.dispose();
    super.dispose();
  }
}
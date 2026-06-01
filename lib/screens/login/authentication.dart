import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/screens/login/Login_page.dart';
import 'package:todo/Providers/Provider_auth.dart';

import '../dash_board_page.dart';
import 'Reset_password.dart';


class Authentication extends StatelessWidget {
  const Authentication({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final authProvider = context.watch<AuthProvider>();
    final isLogin = authProvider.isLogin;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      body: SingleChildScrollView(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 350),
          switchInCurve: Curves.easeOut,
          switchOutCurve: Curves.easeIn,
          transitionBuilder: (child, animation) {
            return FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0.08, 0),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              ),
            );
          },
          child: Column(
            children: [

              // HEADER
              Container(
                height: h * .30,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF4A90E2),
                      Color(0xFF5CA9FF),
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(35),
                    bottomRight: Radius.circular(35),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 42,
                      backgroundColor: Colors.white24,
                      child: Icon(
                        isLogin
                            ? Icons.task_alt_rounded
                            : Icons.person_add_alt_1_rounded,
                        color: Colors.white,
                        size: 45,
                      ),
                    ),
                    const SizedBox(height: 14),
                    Text(
                      isLogin
                          ? "Welcome Back"
                          : "Create Account",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      isLogin
                          ? "Login to continue"
                          : "Start managing your tasks",
                      style: const TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),

              Transform.translate(
                offset: const Offset(0, -25),
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 24,
                  ),
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(28),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.08),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),

                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [

                      Text(
                        isLogin ? "Login" : "Sign Up",
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4A90E2),
                        ),
                      ),

                      const SizedBox(height: 24),

                      // USERNAME
                      if (!isLogin) ...[
                        TextField(
                          decoration: InputDecoration(
                            hintText: "Username",
                            prefixIcon: const Icon(
                              Icons.person_outline_rounded,
                            ),
                            filled: true,
                            fillColor:
                            const Color(0xFFF5F7FB),
                            border: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.circular(16),
                              borderSide:
                              BorderSide.none,
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),
                      ],

                      // EMAIL
                      TextField(
                        keyboardType:
                        TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: "Email Address",
                          prefixIcon: const Icon(
                            Icons.email_outlined,
                          ),
                          filled: true,
                          fillColor:
                          const Color(0xFFF5F7FB),
                          border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.circular(16),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // PASSWORD
                      Consumer<AuthProvider>(
                        builder: (
                            context,
                            provider,
                            child,
                            ) {
                          return PasswordField(
                            isObscure:
                            !provider.isPasswordVisible,
                            onToggle:
                            provider.togglePasswordVisibility,
                            onChanged: (value) {},
                          );
                        },
                      ),

                      // FORGOT PASSWORD
                      if (isLogin) ...[
                        const SizedBox(height: 8),

                        Align(
                          alignment:
                          Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  transitionDuration:
                                  const Duration(milliseconds: 300),
                                  pageBuilder: (_, animation, __) =>
                                  const ResetPassword(),
                                  transitionsBuilder:
                                      (_, animation, __, child) {
                                    return SlideTransition(
                                      position: Tween<Offset>(
                                        begin: const Offset(1, 0),
                                        end: Offset.zero,
                                      ).animate(animation),
                                      child: child,
                                    );
                                  },
                                ),
                              );
                            },
                            child: const Text(
                              "Forgot Password?",
                              style: TextStyle(
                                color: Color(0xFF4A90E2),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],

                      const SizedBox(height: 20),

                      // BUTTON
                      AnimatedSwitcher(
                        duration: Duration(milliseconds: 300),
                        child: SizedBox(
                          width: double.infinity,
                          height: 56,
                          child: ElevatedButton(
                            onPressed: () {
                              if (isLogin) {
                                Navigator.pushReplacement(
                                  context,
                                  PageRouteBuilder(
                                    transitionDuration:
                                    const Duration(milliseconds: 300),
                                    pageBuilder: (_, animation, __) =>
                                    const Dashboard(),
                                    transitionsBuilder:
                                        (_, animation, __, child) {
                                      return FadeTransition(
                                        opacity: animation,
                                        child: child,
                                      );
                                    },
                                  ),
                                );
                              } else {
                                // signup logic
                              }
                            },
                            style:
                            ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor:
                              const Color(0xFF4A90E2),
                              shape:
                              RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(
                                    18),
                              ),
                            ),
                            child: Text(
                              isLogin
                                  ? "Login"
                                  : "Create Account",
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight:
                                FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.center,
                        children: [
                          Text(
                            isLogin
                                ? "Don't have an account?"
                                : "Already have an account?",
                          ),
                          AnimatedSwitcher(
                            duration: Duration(milliseconds: 300),
                            child: TextButton(
                              onPressed: () {
                                context.read<AuthProvider>().toggleAuthMode();
                              },
                              child: Text(
                                isLogin
                                    ? "Sign Up"
                                    : "Sign In",
                                style:
                                const TextStyle(
                                  color:
                                  Color(0xFF4A90E2),
                                  fontWeight:
                                  FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PasswordField extends StatelessWidget {
  final bool isObscure;
  final VoidCallback onToggle;
  final ValueChanged<String>? onChanged;
  final String? errorText;

  const PasswordField({
    super.key,
    required this.isObscure,
    required this.onToggle,
    required this.onChanged,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isObscure,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: "Password",
        errorText: errorText,
        prefixIcon: const Icon(
          Icons.lock_outline_rounded,
        ),
        suffixIcon: IconButton(
          onPressed: onToggle,
          icon: Icon(
            isObscure
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
          ),
        ),
        filled: true,
        fillColor: const Color(0xFFF5F7FB),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}




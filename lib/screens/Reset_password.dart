import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/Provider_auth.dart';
import '../widgets.dart';


class ResetPassword extends StatelessWidget {
 ResetPassword({super.key});
 final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final authProvider = context.watch<AuthProvider>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 36),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: h * 0.12),
                const Icon(
                  Icons.lock_reset_rounded,
                  size: 90,
                  color: Color(0xFF4A90E2),
                ),
                SizedBox(height: h * 0.04),

                const Text(
                  'Forgot Password?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                const SizedBox(height: 14),

                Text(
                  'Enter your registered email address and we will send you a password reset link.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey.shade600,
                    height: 1.5,
                  ),
                ),

                SizedBox(height: h * 0.06),

                TextFormField(
                  controller: authProvider.userEmail,
                  keyboardType: TextInputType.emailAddress,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is required';
                    }
                    if (!value.contains('@')) {
                      return 'Enter valid email';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Email Address',
                    prefixIcon: const Icon(Icons.email_outlined),
                    filled: true,
                    fillColor: const Color(0xFFF5F7FB),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

            SizedBox(height: h *0.04),



                SizedBox(
                  width: double.infinity,
                  height: 58,
                  child: ElevatedButton(
                    onPressed: authProvider.resetLinkSent
                        ? null
                        : () async {
                      if (!_formKey.currentState!.validate()) return;
                      FocusScope.of(context).unfocus();
                      bool success = await authProvider.resetPassword(
                        authProvider.userEmail.text.trim(),
                      );

                      if (success) {
                        showBannerOverlay(
                          context,
                          'Link sent successfully',
                          Colors.green,
                          const Icon(
                            Icons.check_circle_outline,
                            color: Colors.white,
                          ),
                        );
                      } else {
                        showBannerOverlay(
                          context,
                          authProvider.error ?? 'Something went wrong',
                          Colors.red,
                          const Icon(
                            Icons.error_outline_outlined,
                            color: Colors.white,
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4A90E2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    child: authProvider.isSendingResetLink
                        ? const SizedBox(
                      height: 22,
                      width: 22,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                        : const Text(
                      'Send Reset Link',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                if (authProvider.resetLinkSent) ...[
                  const SizedBox(height: 16),

                  GestureDetector(
                    onTap: () async {
                      if (!_formKey.currentState!.validate()) return;
                      await authProvider.resetPassword(
                        authProvider.userEmail.text.trim(),
                      );

                      showBannerOverlay(
                        context,
                        'Link resent successfully',
                        Colors.green,
                        const Icon(
                          Icons.check_circle_outline,
                          color: Colors.white,
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.restart_alt_outlined,color: Colors.red,),
                        SizedBox(width: 5,),
                        const Text(
                          'Resend Link',
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],

                const SizedBox(height: 16),

                TextButton(
                  onPressed: () {
                    authProvider.isSendingResetLink = false;
                    authProvider.resetLinkSent = false;
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Back to Login',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF4A90E2),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

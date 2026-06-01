import 'package:flutter/material.dart';

import 'authentication.dart';


class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 14,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Settings",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight:
                          FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Manage your account & app",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 56,
                    width: 56,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),),
                    child: const Icon(
                      Icons.settings_rounded,
                      size: 28,
                      color: Color(0xFF4A90E2),
                    ),
                  ),
                ],
              ),
              SizedBox(height: h * 0.03),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF4A90E2),
                      Color(0xFF67B0FF),
                    ],
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(
                        Icons.person_rounded,
                        size: 40,
                        color: Color(0xFF4A90E2),
                      ),
                    ),
                    const SizedBox(width: 18),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Mishaba",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            "mishaba@gmail.com",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.edit_rounded, color: Colors.white,),
                  ],
                ),
              ),
              SizedBox(height: h * 0.035),
              const Text(
                "General",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: h * 0.018),
              settingTile(
                icon: Icons.person_outline_rounded,
                title: "Account",
                subtitle: "Manage your profile",
              ),
              settingTile(
                icon: Icons.notifications_none_rounded,
                title: "Notifications",
                subtitle: "Task reminders & alerts",
              ),
              settingTile(
                icon: Icons.lock_outline_rounded,
                title: "Privacy",
                subtitle: "Password & security",
              ),
              settingTile(
                icon: Icons.color_lens_outlined,
                title: "Appearance",
                subtitle: "Theme & display",
              ),
              SizedBox(height: h * 0.03),
              const Text(
                "Support",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: h * 0.018),
              settingTile(
                icon: Icons.help_outline_rounded,
                title: "Help Center",
                subtitle: "FAQs and support",
              ),
              settingTile(
                icon: Icons.info_outline_rounded,
                title: "About App",
                subtitle: "Version 1.0.0",
              ),
              SizedBox(height: h * 0.035),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) =>  Authentication()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:Color(0xFF4A90E2),
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.logout_rounded, color: Colors.white,),
                      SizedBox(width: 10),
                      Text(
                        "Logout",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: h * 0.12),
            ],
          ),
        ),
      ),
    );
  }

  Widget settingTile({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              height: 52,
              width: 52,
              decoration: BoxDecoration(
                color: const Color(0xFFEAF3FF),
                borderRadius: BorderRadius.circular(16),
              ),

              child: Icon(icon, color: const Color(0xFF4A90E2),),),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    subtitle, style: TextStyle(
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 18,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}

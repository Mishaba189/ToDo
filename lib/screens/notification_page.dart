import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final notifications = [
      {
        "title": "Task Completed",
        "message": "You completed 'Finish Report'",
        "time": "2 min ago",
        "icon": Icons.check_circle_outline,
        "color": Color(0xFF00C48C),
      },
      {
        "title": "Upcoming Task",
        "message": "Project Meeting starts at 2:00 PM",
        "time": "10 min ago",
        "icon": Icons.access_time_rounded,
        "color": Color(0xFFFF9F43),
      },
      {
        "title": "Reminder",
        "message": "Don't forget your Gym Workout today",
        "time": "1 hour ago",
        "icon": Icons.notifications_active_outlined,
        "color": Color(0xFF4A90E2),
      },
      {
        "title": "Health Goal",
        "message": "You've completed 80% of today's goals",
        "time": "3 hours ago",
        "icon": Icons.favorite_border_rounded,
        "color": Color(0xFFFF5A5F),
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            children: [
              const SizedBox(height: 12),

              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child:  Icon(Icons.arrow_back_ios_new_rounded),
                  ),

                  const Expanded(
                    child: Center(
                      child: Text(
                        "Notifications",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  Container(
                    height: 46,
                    width: 46,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Icon(
                      Icons.done_all_rounded,
                      color: Color(0xFF4A90E2),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              Expanded(
                child: ListView.builder(
                  itemCount: notifications.length,
                  itemBuilder: (context, index) {
                    final item = notifications[index];

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 14),
                      child: Container(
                        padding: const EdgeInsets.all(16),
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
                              height: 56,
                              width: 56,
                              decoration: BoxDecoration(
                                color: (item["color"] as Color)
                                    .withOpacity(0.12),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Icon(
                                item["icon"] as IconData,
                                color: item["color"] as Color,
                                size: 28,
                              ),
                            ),

                            const SizedBox(width: 14),

                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item["title"] as String,
                                    style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    item["message"] as String,
                                    style: TextStyle(
                                      color: Colors.grey.shade600,
                                      height: 1.4,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(width: 10),

                            Text(
                              item["time"] as String,
                              style: TextStyle(
                                color: Colors.grey.shade500,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
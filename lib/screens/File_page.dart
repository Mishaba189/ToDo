import 'package:flutter/material.dart';

import 'Home_Page.dart';

class FilePage extends StatelessWidget {
  FilePage({super.key});

  final List<Map<String, dynamic>> taskFiles = [
    {
      "title": "Work Tasks",
      "subtitle": "12 Tasks",
      "icon": Icons.work_outline_rounded,
      "color": const Color(0xFF4A90E2),
    },
    {
      "title": "Personal Notes",
      "subtitle": "8 Tasks",
      "icon": Icons.person_outline_rounded,
      "color": const Color(0xFFFF9F43),
    },
    {
      "title": "Shopping List",
      "subtitle": "15 Tasks",
      "icon": Icons.shopping_bag_outlined,
      "color": const Color(0xFF00C48C),
    },
    {
      "title": "Health Routine",
      "subtitle": "6 Tasks",
      "icon": Icons.favorite_border_rounded,
      "color": const Color(0xFFFF5A5F),
    },
  ];

  final List<Map<String, dynamic>> recentTasks = [
    {
      "title": "Finish UI Design",
      "time": "Today • 10:00 AM",
      "status": "Completed",
    },
    {
      "title": "Doctor Appointment",
      "time": "Today • 12:30 PM",
      "status": "Pending",
    },
    {
      "title": "Buy Groceries",
      "time": "Yesterday • 5:00 PM",
      "status": "Completed",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),

      bottomNavigationBar:
      const BottomMenuBar(selectedIndex: 2),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 14,
          ),

          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [

              /// HEADER
              Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [

                  Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: const [

                      Text(
                        "My Files",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight:
                          FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 4),

                      Text(
                        "Store and manage all tasks",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),

                  Container(
                    height: 52,
                    width: 52,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                      BorderRadius.circular(
                          16),
                    ),
                    child: const Icon(
                      Icons.folder_copy_outlined,
                      color: Color(0xFF4A90E2),
                    ),
                  ),
                ],
              ),

              SizedBox(height: h * 0.03),

              /// STORAGE CARD
              Container(
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  borderRadius:
                  BorderRadius.circular(28),

                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF4A90E2),
                      Color(0xFF64B5FF),
                    ],
                  ),
                ),

                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [

                    const Text(
                      "Task Storage",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 15,
                      ),
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      "41 Tasks Saved",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 20),

                    ClipRRect(
                      borderRadius:
                      BorderRadius.circular(
                          20),
                      child:
                      LinearProgressIndicator(
                        minHeight: 10,
                        value: 0.7,
                        backgroundColor: Colors.white24,
                        valueColor: const AlwaysStoppedAnimation(Colors.white,),
                      ),
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      "70% Storage Used",
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: h * 0.03),
              const Text(
                "Folders",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: h * 0.02),
              GridView.builder(
                itemCount: taskFiles.length,
                shrinkWrap: true,
                physics:
                const NeverScrollableScrollPhysics(),

                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                  childAspectRatio: 1.1,
                ),
                itemBuilder: (context, index) {
                  final item = taskFiles[index];
                  return Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                      BorderRadius.circular(
                          24),

                      boxShadow: [
                        BoxShadow(
                          color: Colors.black
                              .withOpacity(0.03),
                          blurRadius: 10,
                          offset:
                          const Offset(0, 4),
                        ),
                      ],
                    ),

                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      mainAxisAlignment:
                      MainAxisAlignment
                          .spaceBetween,

                      children: [

                        Container(
                          padding:
                          const EdgeInsets.all(
                              14),

                          decoration: BoxDecoration(
                            color: item['color']
                                .withOpacity(0.15),

                            borderRadius:
                            BorderRadius
                                .circular(16),
                          ),

                          child: Icon(
                            item['icon'],
                            size: 32,
                            color: item['color'],
                          ),
                        ),

                        Column(
                          crossAxisAlignment:
                          CrossAxisAlignment
                              .start,

                          children: [

                            Text(
                              item['title'],
                              style:
                              const TextStyle(
                                fontSize: 18,
                                fontWeight:
                                FontWeight
                                    .bold,
                              ),
                            ),

                            const SizedBox(
                                height: 6),

                            Text(
                              item['subtitle'],
                              style: TextStyle(
                                color: Colors
                                    .grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),

              SizedBox(height: h * 0.035),

              /// RECENT TASKS
              Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [

                  const Text(
                    "Recent Tasks",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "See All",
                    ),
                  ),
                ],
              ),

              SizedBox(height: h * 0.015),

              /// RECENT TASK LIST
              ListView.builder(
                itemCount: recentTasks.length,
                shrinkWrap: true,
                physics:
                const NeverScrollableScrollPhysics(),

                itemBuilder: (context, index) {

                  final task =
                  recentTasks[index];

                  final bool completed =
                      task['status'] ==
                          "Completed";

                  return Padding(
                    padding:
                    const EdgeInsets.only(
                      bottom: 14,
                    ),

                    child: Container(
                      padding:
                      const EdgeInsets.all(
                          18),

                      decoration: BoxDecoration(
                        color: Colors.white,

                        borderRadius:
                        BorderRadius.circular(
                            22),

                        boxShadow: [
                          BoxShadow(
                            color: Colors.black
                                .withOpacity(0.03),
                            blurRadius: 10,
                            offset:
                            const Offset(0, 4),
                          ),
                        ],
                      ),

                      child: Row(
                        children: [

                          Container(
                            height: 52,
                            width: 52,

                            decoration:
                            BoxDecoration(
                              color: completed
                                  ? Colors.green
                                  .withOpacity(
                                  0.12)
                                  : Colors.orange
                                  .withOpacity(
                                  0.12),

                              borderRadius:
                              BorderRadius
                                  .circular(
                                  16),
                            ),

                            child: Icon(
                              completed
                                  ? Icons
                                  .check_circle_outline_rounded
                                  : Icons
                                  .pending_actions_rounded,

                              color: completed
                                  ? Colors.green
                                  : Colors.orange,
                            ),
                          ),

                          const SizedBox(
                              width: 16),

                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment
                                  .start,

                              children: [

                                Text(
                                  task['title'],
                                  style:
                                  const TextStyle(
                                    fontSize: 17,
                                    fontWeight:
                                    FontWeight
                                        .bold,
                                  ),
                                ),

                                const SizedBox(
                                    height: 6),

                                Text(
                                  task['time'],
                                  style:
                                  TextStyle(
                                    color: Colors
                                        .grey
                                        .shade600,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Container(
                            padding:
                            const EdgeInsets
                                .symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),

                            decoration:
                            BoxDecoration(
                              color: completed
                                  ? Colors.green
                                  .withOpacity(
                                  0.12)
                                  : Colors.orange
                                  .withOpacity(
                                  0.12),

                              borderRadius:
                              BorderRadius
                                  .circular(
                                  30),
                            ),

                            child: Text(
                              task['status'],

                              style: TextStyle(
                                color: completed
                                    ? Colors.green
                                    : Colors.orange,

                                fontWeight:
                                FontWeight
                                    .w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),

              SizedBox(height: h * 0.12),
            ],
          ),
        ),
      ),
    );
  }
}
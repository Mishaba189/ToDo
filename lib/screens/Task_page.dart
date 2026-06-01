import 'package:flutter/material.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F7FB),
        elevation: 0,
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: InkWell(
            borderRadius: BorderRadius.circular(14),
            onTap: () {Navigator.pop(context);},
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 20,
              color: Colors.black,
            ),
          ),
        ),
        title: const Text(
          "Add Task",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF4A90E2),
                    Color(0xFF67B0FF),
                  ],
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Create New Task",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Stay Organized & Productive",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: const Icon(
                      Icons.edit_note_rounded,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: h * 0.035),
            const Text(
              "Task Title",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            customField(
              hint: "Enter task title",
              icon: Icons.title_rounded,
            ),
            SizedBox(height: h * 0.025),
            const Text(
              "Description",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            customField(
              hint: "Enter task description",
              icon: Icons.description_outlined,
              maxLines: 5,
            ),
            SizedBox(height: h * 0.025),
            const Text(
              "Date",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16,),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
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
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEAF3FF),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(
                      Icons.calendar_month_rounded,
                      color: Color(0xFF4A90E2),
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Task Date",
                          style: TextStyle(fontSize: 13,),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Select your date",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F7FB),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Icon(
                      Icons.edit_calendar_rounded,
                      color: Color(0xFF4A90E2),
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: h * 0.025),
            const Text(
              "Time",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 16,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
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
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEAF3FF),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(
                      Icons.access_time_filled_rounded,
                      color: Color(0xFF4A90E2),
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Task Time",
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Select your time", style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F7FB),
                      borderRadius:
                      BorderRadius.circular(14),
                    ),
                    child: const Icon(
                      Icons.schedule_rounded,
                      color: Color(0xFF4A90E2),
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: h * 0.025),
            const Text(
              "Category",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                categoryChip(
                  title: "Work",
                  color: const Color(0xFF4A90E2),
                ),
                categoryChip(
                  title: "Personal",
                  color: const Color(0xFFFF9F43),
                ),
                categoryChip(
                  title: "Shopping",
                  color: const Color(0xFF00C48C),
                ),
                categoryChip(
                  title: "Health",
                  color: const Color(0xFFFF5A5F),
                ),
                InkWell(
                  onTap: () {
                    TextEditingController controller = TextEditingController();
                    IconData selectedIcon = Icons.work_outline_rounded;
                    final List<IconData> categoryIcons = [
                      Icons.work_outline_rounded,
                      Icons.person_outline_rounded,
                      Icons.shopping_bag_outlined,
                      Icons.favorite_border_rounded,
                      Icons.school_outlined,
                      Icons.book_outlined,
                      Icons.fastfood_rounded,
                      Icons.flight_takeoff_rounded,
                      Icons.movie_outlined,
                      Icons.music_note_rounded,
                      Icons.pets_rounded,
                      Icons.fitness_center_rounded,
                    ];
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (context) {
                        return StatefulBuilder(
                          builder: (context, setState) {
                            return Container(
                              height: 650,
                              padding: const EdgeInsets.all(20),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.vertical(top: Radius.circular(32),),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Container(
                                      height: 5,
                                      width: 55,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade300,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 28),
                                  const Text(
                                    "Create Category",
                                    style: TextStyle(
                                      fontSize: 28,
                                      fontWeight:
                                      FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text("Choose icon and category name",
                                    style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 15,
                                    ),
                                  ),

                                  const SizedBox(height: 28),

                                  /// SELECTED ICON
                                  Center(
                                    child: AnimatedContainer(
                                      duration:
                                      const Duration(
                                          milliseconds: 250),

                                      height: 90,
                                      width: 90,

                                      decoration: BoxDecoration(
                                        color:
                                        const Color(0xFFEAF3FF),

                                        borderRadius:
                                        BorderRadius.circular(
                                            28),
                                      ),

                                      child: Icon(
                                        selectedIcon,
                                        size: 42,
                                        color:
                                        const Color(0xFF4A90E2),
                                      ),
                                    ),
                                  ),

                                  const SizedBox(height: 28),

                                  /// TEXT FIELD
                                  TextField(
                                    controller: controller,

                                    decoration: InputDecoration(
                                      hintText: "Category Name",

                                      filled: true,
                                      fillColor:
                                      const Color(0xFFF5F7FB),

                                      prefixIcon: Icon(
                                        selectedIcon,
                                        color:
                                        const Color(0xFF4A90E2),
                                      ),

                                      border: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(
                                            20),
                                        borderSide:
                                        BorderSide.none,
                                      ),

                                      enabledBorder:
                                      OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(
                                            20),
                                        borderSide:
                                        BorderSide.none,
                                      ),

                                      focusedBorder:
                                      OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(
                                            20),

                                        borderSide:
                                        const BorderSide(
                                          color:
                                          Color(0xFF4A90E2),
                                        ),
                                      ),
                                    ),
                                  ),

                                  const SizedBox(height: 30),

                                  /// ICON TITLE
                                  const Text(
                                    "Choose Icon",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight:
                                      FontWeight.w600,
                                    ),
                                  ),

                                  const SizedBox(height: 18),

                                  /// ICON GRID
                                  Expanded(
                                    child: GridView.builder(
                                      itemCount:
                                      categoryIcons.length,

                                      gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 4,
                                        crossAxisSpacing: 14,
                                        mainAxisSpacing: 14,
                                      ),

                                      itemBuilder:
                                          (context, index) {

                                        final icon =
                                        categoryIcons[index];

                                        final isSelected =
                                            selectedIcon ==
                                                icon;

                                        return InkWell(
                                          borderRadius:
                                          BorderRadius.circular(
                                              20),

                                          onTap: () {

                                            setState(() {
                                              selectedIcon =
                                                  icon;
                                            });
                                          },

                                          child:
                                          AnimatedContainer(
                                            duration:
                                            const Duration(
                                                milliseconds:
                                                250),

                                            decoration:
                                            BoxDecoration(
                                              color: isSelected
                                                  ? const Color(
                                                0xFF4A90E2,
                                              )
                                                  : const Color(
                                                0xFFEAF3FF,
                                              ),

                                              borderRadius:
                                              BorderRadius
                                                  .circular(
                                                  20),
                                            ),

                                            child: Icon(
                                              icon,
                                              size: 30,

                                              color:
                                              isSelected
                                                  ? Colors
                                                  .white
                                                  : const Color(
                                                0xFF4A90E2,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),

                                  const SizedBox(height: 18),

                                  /// BUTTON
                                  SizedBox(
                                    width: double.infinity,

                                    child: ElevatedButton(
                                      onPressed: () {

                                        /// SAVE CATEGORY HERE

                                        Navigator.pop(context);
                                      },

                                      style:
                                      ElevatedButton.styleFrom(
                                        backgroundColor:
                                        const Color(
                                          0xFF4A90E2,
                                        ),

                                        elevation: 0,

                                        padding:
                                        const EdgeInsets
                                            .symmetric(
                                          vertical: 18,
                                        ),

                                        shape:
                                        RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(
                                              22),
                                        ),
                                      ),

                                      child: const Text(
                                        "Create Category",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                          fontWeight:
                                          FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),

                                  SizedBox(
                                    height:
                                    MediaQuery.of(context)
                                        .viewInsets
                                        .bottom +
                                        10,
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    );
                  },

                  child: Container(
                    padding:
                    const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 12,
                    ),

                    decoration: BoxDecoration(
                      color: const Color(0xFFEAF3FF),

                      borderRadius:
                      BorderRadius.circular(16),

                      border: Border.all(
                        color: const Color(0xFF4A90E2),
                      ),
                    ),

                    child: const Row(
                      mainAxisSize: MainAxisSize.min,

                      children: [

                        Icon(
                          Icons.add_rounded,
                          size: 18,
                          color: Color(0xFF4A90E2),
                        ),

                        SizedBox(width: 6),

                        Text(
                          "Add Category",
                          style: TextStyle(
                            color: Color(0xFF4A90E2),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: h * 0.025),
            SizedBox(
              width: double.infinity,

              child: ElevatedButton(
                onPressed: () {},

                style:
                ElevatedButton.styleFrom(
                  backgroundColor:
                  const Color(0xFF4A90E2),

                  elevation: 0,

                  padding:
                  const EdgeInsets.symmetric(
                    vertical: 18,
                  ),

                  shape:
                  RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(
                        20),
                  ),
                ),

                child: const Row(
                  mainAxisAlignment:
                  MainAxisAlignment.center,

                  children: [

                    Icon(
                      Icons.add_task_rounded,
                      color: Colors.white,
                    ),

                    SizedBox(width: 10),

                    Text(
                      "Create Task",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: h * 0.04),
          ],
        ),
      ),
    );
  }

  Widget customField({
    required String hint,
    required IconData icon,
    int maxLines = 1,
    bool ?  enabled,
  }) {

    return TextField(
      enabled: enabled,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,

        hintStyle: TextStyle(
          color: Colors.grey.shade500,
        ),

        prefixIcon: Icon(
          icon,
          color: const Color(0xFF4A90E2),
        ),

        filled: true,
        fillColor: Colors.white,

        contentPadding:
        const EdgeInsets.symmetric(
          vertical: 18,
          horizontal: 16,
        ),

        border: OutlineInputBorder(
          borderRadius:
          BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius:
          BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius:
          BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: Color(0xFF4A90E2),
            width: 1.5,
          ),
        ),
      ),
    );
  }


  Widget categoryChip({
    required String title,
    required Color color,
  }) {

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 12,
      ),

      decoration: BoxDecoration(
        color: color.withOpacity(0.12),

        borderRadius:
        BorderRadius.circular(16),

        border: Border.all(
          color: color.withOpacity(0.4),
        ),
      ),

      child: Text(
        title,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}


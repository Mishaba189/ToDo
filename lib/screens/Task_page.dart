import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/task_provider.dart';
import '../widgets.dart';

//create date selector and time selector
//add function to create task
// give selection when tap the category
// add error  handling : cant create new category with name null/empty
// add error handling to the create task

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final provider = context.watch<TaskProvider>();

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
            onTap: () {
              Navigator.pop(context);
              provider.loadCategories();
            },
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
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Accent Header Box
            Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: const LinearGradient(
                  colors: [Color(0xFF4A90E2), Color(0xFF67B0FF)],
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Create New Task",
                          style: TextStyle(color: Colors.white70, fontSize: 15),
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

            // Task Title Input Field
            const Text(
              "Task Title",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            customField(
              hint: "Enter task title",
              icon: Icons.title_rounded,
              controller: provider.taskTitleController,
            ),
            SizedBox(height: h * 0.025),

            // Task Description Input Field
            const Text(
              "Description",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            customField(
              hint: "Enter task description",
              icon: Icons.description_outlined,
              maxLines: 5,
              controller: provider.taskDescController,
            ),
            SizedBox(height: h * 0.025),

            // Date Picker
            const Text(
              "Date",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            InkWell(
              borderRadius: BorderRadius.circular(24),
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                );
                if (pickedDate != null) {
                  provider.setDate(pickedDate);
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
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
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Task Date", style: TextStyle(fontSize: 13)),
                          const SizedBox(height: 4),
                          Text(
                            provider.selectedDate == null
                                ? "Select your date"
                                : "${provider.selectedDate!.day}/${provider.selectedDate!.month}/${provider.selectedDate!.year}",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: provider.selectedDate == null ? Colors.grey : Colors.black,
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
            ),
            SizedBox(height: h * 0.025),

            // Time Selector
            const Text(
              "Time",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            InkWell(
              borderRadius: BorderRadius.circular(24),
              onTap: () async {
                TimeOfDay? pickedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (pickedTime != null) {
                  provider.setTime(pickedTime);
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
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
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Task Time", style: TextStyle(fontSize: 13)),
                          const SizedBox(height: 4),
                          Text(
                            provider.selectedTime == null
                                ? "Select your time"
                                : provider.selectedTime!.format(context),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: provider.selectedTime == null ? Colors.grey : Colors.black,
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
                        Icons.schedule_rounded,
                        color: Color(0xFF4A90E2),
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: h * 0.025),

            // Category
            const Text(
              "Category",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                ...provider.categories.map(
                      (category) {
                    final isSelected = provider.selectedCategoryId == category.id;
                    return InkWell(
                      borderRadius: BorderRadius.circular(16),
                      onTap: () {
                        provider.selectCategory(category.id);
                      },
                      child: categoryChip(
                        title: category.name,
                        color: Color(category.colorValue),
                        isSelected: isSelected,
                      ),
                    );
                  },
                ),
                InkWell(
                  onTap: () {
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
                          builder: (context, setModalState) {
                            return Container(
                              height: 650,
                              padding: const EdgeInsets.all(20),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
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
                                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    "Choose icon and category name",
                                    style: TextStyle(color: Colors.grey.shade600, fontSize: 15),
                                  ),
                                  const SizedBox(height: 28),
                                  Center(
                                    child: AnimatedContainer(
                                      duration: const Duration(milliseconds: 250),
                                      height: 90,
                                      width: 90,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFEAF3FF),
                                        borderRadius: BorderRadius.circular(28),
                                      ),
                                      child: Icon(
                                        selectedIcon,
                                        size: 42,
                                        color: const Color(0xFF4A90E2),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 28),
                                  TextField(
                                    controller: provider.taskName,
                                    decoration: InputDecoration(
                                      hintText: "Category Name",
                                      filled: true,
                                      fillColor: const Color(0xFFF5F7FB),
                                      prefixIcon: Icon(selectedIcon, color: const Color(0xFF4A90E2)),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide.none,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide.none,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: const BorderSide(color: Color(0xFF4A90E2)),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 30),
                                  const Text(
                                    "Choose Icon",
                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(height: 18),
                                  Expanded(
                                    child: GridView.builder(
                                      itemCount: categoryIcons.length,
                                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 4,
                                        crossAxisSpacing: 14,
                                        mainAxisSpacing: 14,
                                      ),
                                      itemBuilder: (context, index) {
                                        final icon = categoryIcons[index];
                                        final isSelected = selectedIcon == icon;
                                        return InkWell(
                                          borderRadius: BorderRadius.circular(20),
                                          onTap: () {
                                            setModalState(() {
                                              selectedIcon = icon;
                                            });
                                          },
                                          child: AnimatedContainer(
                                            duration: const Duration(milliseconds: 250),
                                            decoration: BoxDecoration(
                                              color: isSelected ? const Color(0xFF4A90E2) : const Color(0xFFEAF3FF),
                                              borderRadius: BorderRadius.circular(20),
                                            ),
                                            child: Icon(
                                              icon,
                                              size: 30,
                                              color: isSelected ? Colors.white : const Color(0xFF4A90E2),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  const SizedBox(height: 18),
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        bool isCreated = await provider.createCategory(
                                          provider.taskName.text.trim(),
                                          selectedIcon,
                                        );

                                        if (isCreated) {
                                          provider.taskName.clear();
                                          Navigator.pop(context);
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            const SnackBar(content: Text("Category created safely!")),
                                          );
                                        } else {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            const SnackBar(
                                              content: Text("Category name cannot be blank!"),
                                              backgroundColor: Colors.redAccent,
                                            ),
                                          );
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(0xFF4A90E2),
                                        elevation: 0,
                                        padding: const EdgeInsets.symmetric(vertical: 18),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(22),
                                        ),
                                      ),
                                      child: const Text(
                                        "Create Category",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: MediaQuery.of(context).viewInsets.bottom + 10),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEAF3FF),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: const Color(0xFF4A90E2)),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.add_rounded, size: 18, color: Color(0xFF4A90E2)),
                        SizedBox(width: 6),
                        Text(
                          "Add Category",
                          style: TextStyle(color: Color(0xFF4A90E2), fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: h * 0.025),

            // Submit Final Task Execution Action Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  String? errorMessage = await provider.createTask();
                  if (errorMessage != null) {
                    // Task compilation validation checks hit
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(errorMessage),
                        backgroundColor: Colors.red,
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Task successfully created!"),
                        backgroundColor: Colors.green,
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4A90E2),
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add_task_rounded, color: Colors.white),
                    SizedBox(width: 10),
                    Text(
                      "Create Task",
                      style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
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
    bool? enabled,
    required TextEditingController controller, // Added missing controller parameter Hook
  }) {
    return TextField(
      controller: controller,
      enabled: enabled,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey.shade500),
        prefixIcon: Icon(icon, color: const Color(0xFF4A90E2)),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Color(0xFF4A90E2), width: 1.5),
        ),
      ),
    );
  }

  Widget categoryChip({
    required String title,
    required Color color,
    required bool isSelected, // Added parameter to style selection states
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      decoration: BoxDecoration(
        color: isSelected ? color : color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isSelected ? Colors.transparent : color.withOpacity(0.4),
        ),
        boxShadow: isSelected
            ? [BoxShadow(color: color.withOpacity(0.4), blurRadius: 8, offset: const Offset(0, 4))]
            : [],
      ),
      child: Text(
        title,
        style: TextStyle(
          color: isSelected ? Colors.white : color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}


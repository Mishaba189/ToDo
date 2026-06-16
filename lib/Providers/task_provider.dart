import 'dart:math';
import 'package:flutter/material.dart';
import 'package:todo/services/task_services.dart';
import '../models/category_model.dart';

class TaskProvider extends ChangeNotifier {
  final TaskServices taskServices = TaskServices();

  // Input Controllers
  final TextEditingController taskName = TextEditingController(); // For category creation
  final TextEditingController taskTitleController = TextEditingController();
  final TextEditingController taskDescController = TextEditingController();

  // Selection states
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  String? selectedCategoryId;

  final List<Color> categoryColors = [
    const Color(0xFF5B8DEF),
    const Color(0xFF7C4DFF),
    const Color(0xFFFF4D8D),
    const Color(0xFFFF6B35),
    const Color(0xFFFFC107),
    const Color(0xFF00C853),
    const Color(0xFF00B8D4),
    const Color(0xFF9C27B0),
  ];

  List<CategoryModel> categories = [];

  Future<void> loadCategories() async {
    categories = await taskServices.getCategories();
    notifyListeners();
  }

  // Update Selections
  void setDate(DateTime date) {
    selectedDate = date;
    notifyListeners();
  }

  void setTime(TimeOfDay time) {
    selectedTime = time;
    notifyListeners();
  }

  void selectCategory(String id) {
    selectedCategoryId = id;
    notifyListeners();
  }

  // Category Creation with empty handling
  Future<bool> createCategory(String name, IconData icon) async {
    if (name.isEmpty) {
      return false;
    }
    final random = Random();
    Color randomColor = categoryColors[random.nextInt(categoryColors.length)];
    await taskServices.addCategory(name, icon, randomColor);
    await loadCategories();
    return true;
  }

  // Task Creation with strict Error validation
  Future<String?> createTask() async {
    final title = taskTitleController.text.trim();
    final description = taskDescController.text.trim();

    if (title.isEmpty) return "Task title cannot be empty";
    if (selectedDate == null) return "Please select a date";
    if (selectedTime == null) return "Please select a execution time";
    if (selectedCategoryId == null) return "Please choose a category";

    try {
      final formattedTime = "${selectedTime!.hour.toString().padLeft(2, '0')}:${selectedTime!.minute.toString().padLeft(2, '0')}";

      await taskServices.addTask(
        title: title,
        description: description,
        date: selectedDate!,
        time: formattedTime,
        categoryId: selectedCategoryId!,
      );

      // Reset state on success
      taskTitleController.clear();
      taskDescController.clear();
      selectedDate = null;
      selectedTime = null;
      selectedCategoryId = null;
      notifyListeners();

      return null;
    } catch (e) {
      return "Failed to save task: ${e.toString()}";
    }
  }

  Future<void> deleteCategory(String id) async {
    await taskServices.deleteCategory(id: id);
    if (selectedCategoryId == id) selectedCategoryId = null;
    await loadCategories();
  }
}
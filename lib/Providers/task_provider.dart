import 'dart:math';
import 'package:flutter/material.dart';
import 'package:todo/services/task_services.dart';

import '../models/category_model.dart';

class TaskProvider extends ChangeNotifier {

  final TaskServices taskServices = TaskServices();

  final TextEditingController taskName= TextEditingController();

  final List<Color> categoryColors = [
    const Color(0xFF5B8DEF), // Royal Blue
    const Color(0xFF7C4DFF), // Deep Violet
    const Color(0xFFFF4D8D), // Hot Pink
    const Color(0xFFFF6B35), // Vibrant Orange
    const Color(0xFFFFC107), // Amber
    const Color(0xFF00C853), // Emerald Green
    const Color(0xFF00B8D4), // Aqua
    const Color(0xFF9C27B0), // Rich Purple
  ];

  List<CategoryModel> categories = [];

  Future<void> loadCategories() async {
    categories = await taskServices.getCategories();
    notifyListeners();
  }

  Future<void> createCategory(
      String name,
      IconData icon,
      ) async {
    final random = Random();
    Color randomColor = categoryColors[random.nextInt(categoryColors.length)];
    await taskServices.addCategory(
      name,
      icon,
      randomColor,
    );
    await loadCategories();
  }

  Future<void> deleteCategory(String id) async {
    await taskServices.deleteCategory(id: id);
    await loadCategories();
  }
}
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:todo/services/task_services.dart';

import '../models/category_model.dart';

class TaskProvider extends ChangeNotifier {

  final TaskServices taskServices = TaskServices();

  final TextEditingController taskName= TextEditingController();

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
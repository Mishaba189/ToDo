import 'dart:math';
import 'package:flutter/material.dart';
import 'package:todo/services/task_services.dart';

import '../models/category_model.dart';

class TaskProvider extends ChangeNotifier {

  final TaskServices taskServices = TaskServices();

  final TextEditingController taskName= TextEditingController();

  final List<Color> categoryColors = [
    const Color(0xFF4A90E2),
    const Color(0xFFFF9F43),
    const Color(0xFF00C48C),
    const Color(0xFFFF5A5F),
    const Color(0xFF9B59B6),
    const Color(0xFFF1C40F),
    const Color(0xFF1ABC9C),
    const Color(0xFFE67E22),
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
}
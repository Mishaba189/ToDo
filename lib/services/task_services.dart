import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../models/category_model.dart';

class TaskServices {

  Future<void> addCategory(
      String name,
      IconData icon,
      Color color,
      ) async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('categories')
        .add({
      'name': name,
      'icon': icon.codePoint,
      'color': color.value,
    });
  }

  Future<List<CategoryModel>> getCategories() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('categories')
        .get();
    return snapshot.docs.map((doc) {
      return CategoryModel.fromMap(
        doc.data(),
        doc.id,
      );
    }).toList();
  }
}
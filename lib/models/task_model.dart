import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel {
  final String id;
  final String title;
  final String description;
  final String category;
  final DateTime date;
  final DateTime time;


  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.date,
    required this.time



  });

  Map<String,dynamic> toMap(){
    return{
      "id" : id,
      "title" : title,
      "description" : description,
      "category": category,
      "date" : date,
      "time" :  time


    };
  }

  factory TaskModel.fromMap(Map<String,dynamic>map ,String id){
    return TaskModel(
        id: id,
      title: map['title'] ?? '',
      description:  map['description'] ?? '',
      category: map['category'] ?? '',
      date: (map['date'] as Timestamp).toDate(),
      time: (map['time'] as Timestamp).toDate()


    );
  }
}
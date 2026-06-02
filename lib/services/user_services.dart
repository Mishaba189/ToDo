import 'package:cloud_firestore/cloud_firestore.dart';

class UserServices {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  String ? error;

  Future<void>saveUserData(
      String uid,
      String name,
      String email
      )async{
    await firestore.collection('users').doc(uid).set(
      {
        "name" : name,
        "email": email,
        "createdAt": FieldValue.serverTimestamp()
      }
    );
  }


  Future<void> checkEmail(String email) async {
    final userQuery = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: email)
        .limit(1)
        .get();

    if (userQuery.docs.isEmpty) {
      throw Exception("You are not registered");
    }
  }



}
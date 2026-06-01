import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  final FirebaseAuth auth = FirebaseAuth.instance;
  Future<User>register(String email, String password)async{
    final credentials = await auth.createUserWithEmailAndPassword(email: email, password: password);
    return credentials.user!;
  }
  Future<User>login(String email , String password) async {
    final credentials = await auth.signInWithEmailAndPassword(email: email, password: password);
    return credentials.user!;
  }
  Future<void>logout()async{
    await auth.signOut();
  }

  String getReadableError(dynamic e) {
    if (e is FirebaseAuthException) {
      switch (e.code) {

        case 'invalid-email':
          return 'Invalid email format';

        case 'user-not-found':
          return 'You are not registered. Please create an account';

        case 'wrong-password':
          return 'Incorrect password';

        case 'invalid-credential':
          return 'Incorrect email or password';

        case 'email-already-in-use':
          return 'Email already registered';

        case 'weak-password':
          return 'Password should be at least 6 characters';

        case 'network-request-failed':
          return 'Check your internet connection';

        case 'too-many-requests':
          return 'Too many attempts. Try again later';

        case 'user-disabled':
          return 'This account has been disabled';

        default:
          return e.message ?? 'Something went wrong';
      }
    }

    return e.toString();
  }

}
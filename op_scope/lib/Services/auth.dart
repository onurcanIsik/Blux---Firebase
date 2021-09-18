import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final _firebaseAuth = FirebaseAuth.instance;

  Future<User> createSignInEmail(String email, String password) async {
    final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    return userCredential.user!;
  }

  Future<User> signInEmail(String email, String password) async {
    final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return userCredential.user!;
  }

  Future<void> signOut() async {
    final userCredential = await _firebaseAuth.signOut();
    return userCredential;
  }
}

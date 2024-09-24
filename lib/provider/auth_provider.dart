import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class FirebaseAuthProvider with ChangeNotifier {

  final _auth = FirebaseAuth.instance;
  User? get currentUser => _auth.currentUser;

  Future<void> loginUser(String email, String password) async {
    final credenchial = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
  }
  Future<void> logout ()=> _auth.signOut();


}
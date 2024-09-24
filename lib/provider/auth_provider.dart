import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:note_app_flutter_firebase/model/user_model.dart';

import '../database/db_helper.dart';

class FirebaseAuthProvider with ChangeNotifier {

  final _auth = FirebaseAuth.instance;

  User? get currentUser => _auth.currentUser;

  Future<void> loginUser(String email, String password) async {
    final credenchial = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> registerUser(String name, String email, String password) async {
    final credenchial = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    return DbHelper.addNewUser(UserModel(uid: credenchial.user!.uid, email: email, name: name));
  }


  Future<void> logout() => _auth.signOut();


}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:note_app_flutter_firebase/model/note_model.dart';
import 'package:note_app_flutter_firebase/model/user_model.dart';

class DbHelper {
  DbHelper._();
  static final _db =
      FirebaseFirestore.instance; //Firebase database object creating,
  static const String _collectionUser = 'Users';
  static const String _collectionUserNote = 'Notes';

  static Future<void> addNewUser(UserModel user) {
    return _db.collection(_collectionUser)
        .doc(user.uid)
        .set(user.toMap());
  }

  static Future<void> addNote(NoteModel model,) {

    final doc = _db.collection(_collectionUserNote).doc();
    model.id = doc.id;
    return doc.set(model.toMap());




  }

}
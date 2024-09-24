import 'package:flutter/foundation.dart';
import 'package:note_app_flutter_firebase/database/db_helper.dart';
import 'package:note_app_flutter_firebase/model/note_model.dart';

class NoteProvider with ChangeNotifier {
  List<NoteModel> noteList = [];
  
  Future<void> addNote(NoteModel model) {
    return DbHelper.addNote(model);
  }
  getAllNote() {
    DbHelper.getAllNoteList().listen((snapshot){
      noteList = List.generate(snapshot.docs.length, (index) =>
      NoteModel.fromMap(snapshot.docs[index].data()));
      notifyListeners();
    });
  }

}
import 'package:flutter/material.dart';
import 'package:note_app_flutter_firebase/model/note_model.dart';

class NoteItemView extends StatelessWidget {
  const NoteItemView({super.key, required this.note});
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const CircleAvatar(child: Icon(Icons.note_alt_rounded)),
        title: Text(note.title,style: const TextStyle(fontSize: 22,fontWeight: FontWeight.w700,color: Colors.blue),),
        subtitle: Text(note.description,style: const TextStyle(fontSize: 16,color: Colors.orange),),
      )
    );
  }
}

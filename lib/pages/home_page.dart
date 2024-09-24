import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:note_app_flutter_firebase/custom_widget/note_item_view.dart';
import 'package:note_app_flutter_firebase/main.dart';
import 'package:note_app_flutter_firebase/model/note_model.dart';
import 'package:note_app_flutter_firebase/pages/add_note_page.dart';
import 'package:note_app_flutter_firebase/pages/login_page.dart';
import 'package:note_app_flutter_firebase/provider/auth_provider.dart';
import 'package:note_app_flutter_firebase/provider/note_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/home';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<NoteProvider>().getAllNote();
    return Scaffold(
        floatingActionButton: IconButton(
          style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Colors.orange.shade400)),
          onPressed: () => Navigator.pushNamed(context, AddNotePage.routeName),
          icon: const Icon(
            Icons.add,
            size: 30,
          ),
        ),
        appBar: AppBar(
          actions: [
            TextButton(
              onPressed: () =>
                  context.read<FirebaseAuthProvider>().logout().then((_) {
                Navigator.pushReplacementNamed(context, LoginPage.routeName);
              }), child: const Text('Logout'),
            ),
          ],
        ),
        body: Consumer<NoteProvider>(builder: (context, provider, child) => ListView.builder(
    itemCount: provider.noteList.length,
    itemBuilder: (context, index){
      final note = provider.noteList[index];
      return NoteItemView(note: note);
    },
    )));
  }
}

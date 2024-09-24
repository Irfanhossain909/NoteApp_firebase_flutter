import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:note_app_flutter_firebase/model/note_model.dart';
import 'package:note_app_flutter_firebase/provider/note_provider.dart';
import 'package:note_app_flutter_firebase/utils/widget_function.dart';
import 'package:provider/provider.dart';

import '../provider/auth_provider.dart';

class AddNotePage extends StatefulWidget {
  static const String routeName = '/addNote';

  const AddNotePage({super.key});

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Note'),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 50),
                child: Card(
                  surfaceTintColor: Colors.red,
                  child: Padding(
                    padding: EdgeInsets.only(left: 40, right: 40),
                    child: Text(
                      'Add Note',
                      style: TextStyle(
                        fontSize: 46,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12, right: 12),
                child: TextFormField(
                  controller: _titleController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    hintText: 'Title',
                    prefixIcon: Icon(Icons.title),
                    border: OutlineInputBorder(),
                    // Default border
                    enabledBorder: OutlineInputBorder(
                      // Border when the field is enabled
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      // Border when the field is focused
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'is empty';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12, right: 12),
                child: TextFormField(
                  controller: _descriptionController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    hintText: 'Description',
                    prefixIcon: Icon(Icons.description),
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'is empty';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: (){
                  _save();
                  print('note save');
                },
                child: const Text(
                  'Save',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _save() async {
    if (_formKey.currentState!.validate()) {
      EasyLoading.show(status: 'Please wait..');
      try {
        final note = NoteModel(
          title: _titleController.text,
          description: _descriptionController.text,
        );
        await context.read<NoteProvider>().addNote(note);
        showMsg(context, 'Note Saved');
        _resetFields();
        EasyLoading.dismiss();

      }catch (error) {
        EasyLoading.dismiss();
        showMsg(context, error.toString());
      }
    }
  }

  void _resetFields() {
    setState(() {
      _titleController.clear();
      _descriptionController.clear();
    });
  }
}

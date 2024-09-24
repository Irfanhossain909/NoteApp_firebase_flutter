import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:note_app_flutter_firebase/main.dart';
import 'package:note_app_flutter_firebase/pages/login_page.dart';
import 'package:note_app_flutter_firebase/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: ()=> context.read<FirebaseAuthProvider>().logout().then((_){
              Navigator.pushReplacementNamed(context, LoginPage.routeName);
            }),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: const Center(child: Text('Home Page')),
    );
  }
}

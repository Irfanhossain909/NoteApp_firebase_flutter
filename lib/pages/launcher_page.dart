import 'package:flutter/material.dart';
import 'package:note_app_flutter_firebase/pages/home_page.dart';
import 'package:note_app_flutter_firebase/pages/login_page.dart';
import 'package:note_app_flutter_firebase/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class LauncherPage extends StatefulWidget {
  static const String routeName = '/';
  const LauncherPage({super.key});

  @override
  State<LauncherPage> createState() => _LauncherPageState();
}

class _LauncherPageState extends State<LauncherPage> {
  @override
  void didChangeDependencies() {
    final authProvider = context.read<FirebaseAuthProvider>();
    Future.delayed(const Duration(seconds: 0), (){
      if(authProvider.currentUser != null) {
        Navigator.pushReplacementNamed(context, HomePage.routeName);
      }else{
        Navigator.pushReplacementNamed(context, LoginPage.routeName);
      }
    });
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}

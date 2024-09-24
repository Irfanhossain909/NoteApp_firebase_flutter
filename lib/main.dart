import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:note_app_flutter_firebase/firebase_options.dart';
import 'package:note_app_flutter_firebase/pages/home_page.dart';
import 'package:note_app_flutter_firebase/pages/launcher_page.dart';
import 'package:note_app_flutter_firebase/pages/login_page.dart';
import 'package:note_app_flutter_firebase/provider/auth_provider.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FirebaseAuthProvider()),
      ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: LauncherPage.routeName,
      routes: {
        LauncherPage.routeName : (context) => const LauncherPage(),
        HomePage.routeName : (context) => const HomePage(),
        LoginPage.routeName : (context) => const LoginPage(),
      },
    );
  }
}



import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:note_app_flutter_firebase/firebase_options.dart';
import 'package:note_app_flutter_firebase/pages/add_note_page.dart';
import 'package:note_app_flutter_firebase/pages/home_page.dart';
import 'package:note_app_flutter_firebase/pages/launcher_page.dart';
import 'package:note_app_flutter_firebase/pages/login_page.dart';
import 'package:note_app_flutter_firebase/pages/registration_page.dart';
import 'package:note_app_flutter_firebase/provider/auth_provider.dart';
import 'package:note_app_flutter_firebase/provider/note_provider.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FirebaseAuthProvider()),
        ChangeNotifierProvider(create: (context) => NoteProvider()),
      ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      builder: EasyLoading.init(),
      initialRoute: LauncherPage.routeName,
      routes: {
        LauncherPage.routeName : (context) => const LauncherPage(),
        HomePage.routeName : (context) => const HomePage(),
        LoginPage.routeName : (context) => const LoginPage(),
        RegistrationPage.routeName : (context) => const RegistrationPage(),
        AddNotePage.routeName : (context) => const AddNotePage(),
      },
    );
  }
}



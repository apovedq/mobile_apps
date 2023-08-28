import 'file:///C:/Users/poved/AndroidStudioProjects/evva_app/lib/Screens/mainpage.dart';
import 'package:evva_app/Screens/loginpage.dart';
import 'package:evva_app/Screens/mainpage.dart';
import 'package:evva_app/Screens/registrationpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:io';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final FirebaseApp app = await Firebase.initializeApp(
    name: 'db2',
    options: Platform.isIOS || Platform.isMacOS
        ? const FirebaseOptions(
      appId: '1:297855924061:ios:c6de2b69b03a5be8',
      apiKey: 'AIzaSyD_shO5mfO9lhy2TVWhfo1VUmARKlG4suk',
      projectId: 'flutter-firebase-plugins',
      messagingSenderId: '54724169362',
      databaseURL: 'https://flutterfire-cd2f7.firebaseio.com',
    )
        : const FirebaseOptions(
      appId: '1:54724169362:android:86c69564cd8b734b9ba04b',
      apiKey: 'AIzaSyBq64X65Yc0Q1YzW53Z9C_J4ohlsD3ZUd4',
      messagingSenderId: '54724169362',
      projectId: 'flutter-firebase-plugins',
      databaseURL: 'https://evva-7d405-default-rtdb.firebaseio.com',
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily:'Brand-Regular',
        primarySwatch: Colors.blue,
      ),
      initialRoute: RegistrationPage.id,
      routes: {
          RegistrationPage.id: (context) => RegistrationPage(),
          LoginPage.id: (context) => LoginPage(),

      },
    );
  }
}


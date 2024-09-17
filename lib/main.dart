import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_first_project/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
      options:const FirebaseOptions(
          apiKey: "AIzaSyAREjg6VlIM2YLrR3Lizmk5x_UEoKLYLPg",
          appId: "1:1041464014558:android:fc6da35e1acb1f5a36744f",
          messagingSenderId: "1041464014558",
          projectId: "phone-otp-c106a"))
      :
  Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
        fontFamily: 'lato',
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          primary: Colors.grey[300],
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
          bodyMedium: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
          bodyLarge: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          bodySmall: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.white,
          ),
          titleMedium: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}


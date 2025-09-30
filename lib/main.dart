// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyDVjWSR1m7gwp306vXm8EwSjP-3RyyQSa0",
        appId: "1:894212066683:android:828315f4bbebb43a95c1de",
        messagingSenderId: '894212066683',
        projectId: "zuganest",
      ),
    );
    print("Firebase initialized successfully");
  } catch (e) {
    print("Firebase initialization error: $e");
  }
  runApp(ZugaNestApp());
}

class ZugaNestApp extends StatelessWidget {
  const ZugaNestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ZugaNest',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginScreen(),
      routes: {'/home': (context) => HomeScreen()},
    );
  }
}

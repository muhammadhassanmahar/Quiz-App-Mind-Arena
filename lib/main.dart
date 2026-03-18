import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const MindArenaApp());
}

class MindArenaApp extends StatelessWidget {
  // Added const constructor with key
  const MindArenaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Mind Arena",

      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),

      home: const LoginScreen(),
    );
  }
}
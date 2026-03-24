import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const MindArenaApp());
}

class MindArenaApp extends StatelessWidget {
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

      // ❌ const hata diya yahan se
      home: LoginScreen(),
    );
  }
}
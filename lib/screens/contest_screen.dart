import 'package:flutter/material.dart';
import 'quiz_screen.dart';

class ContestScreen extends StatelessWidget {
  final int fee;

  // Added const constructor + key
  const ContestScreen({super.key, required this.fee});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("$fee PKR Contest")),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Text("Players: 10/20"),

            const SizedBox(height: 20),

            ElevatedButton(
              child: const Text("Join Contest"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const QuizScreen(),
                  ),
                );
              },
            ),

          ],
        ),
      ),
    );
  }
}
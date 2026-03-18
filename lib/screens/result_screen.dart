import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  // Added const constructor with key
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Result")),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Text(
              "🎉 Result",
              style: TextStyle(fontSize: 24),
            ),

            const SizedBox(height: 10),

            const Text("Rank #3"),

            const SizedBox(height: 5),

            const Text("You won 200 PKR"),

          ],
        ),
      ),
    );
  }
}
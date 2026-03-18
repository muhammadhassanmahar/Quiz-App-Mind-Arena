import 'package:flutter/material.dart';
import 'result_screen.dart';

class QuizScreen extends StatefulWidget {
  // Added const constructor with key
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => QuizScreenState();
}

// Removed private (_) to fix public API issue
class QuizScreenState extends State<QuizScreen> {

  int questionIndex = 0;

  List<String> questions = [
    "2 + 2 = ?",
    "5 + 3 = ?"
  ];

  void nextQuestion() {
    if (questionIndex < questions.length - 1) {
      setState(() {
        questionIndex++;
      });
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const ResultScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Quiz")),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              questions[questionIndex],
              style: const TextStyle(fontSize: 22),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: nextQuestion,
              child: const Text("A"),
            ),

            ElevatedButton(
              onPressed: nextQuestion,
              child: const Text("B"),
            ),

            ElevatedButton(
              onPressed: nextQuestion,
              child: const Text("C"),
            ),

            ElevatedButton(
              onPressed: nextQuestion,
              child: const Text("D"),
            ),

          ],
        ),
      ),
    );
  }
}
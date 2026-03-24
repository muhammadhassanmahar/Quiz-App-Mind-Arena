import 'package:flutter/material.dart';

class QuestionWidget extends StatelessWidget {
  final String question;
  final List<String> options;
  final Function(String) onAnswer;

  const QuestionWidget({
    super.key,
    required this.question,
    required this.options,
    required this.onAnswer,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          question,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 20),

        // ✅ toList() remove kar diya
        ...options.map((option) {
          return Container(
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 10),
            child: ElevatedButton(
              onPressed: () => onAnswer(option),
              child: Text(option),
            ),
          );
        }),

      ],
    );
  }
}
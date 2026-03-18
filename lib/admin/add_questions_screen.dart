import 'package:flutter/material.dart';

class AddQuestionsScreen extends StatefulWidget {
  const AddQuestionsScreen({super.key});

  @override
  State<AddQuestionsScreen> createState() => AddQuestionsScreenState();
}

// Removed private (_) to fix public API warning
class AddQuestionsScreenState extends State<AddQuestionsScreen> {

  final TextEditingController questionController = TextEditingController();
  final TextEditingController optionA = TextEditingController();
  final TextEditingController optionB = TextEditingController();
  final TextEditingController optionC = TextEditingController();
  final TextEditingController optionD = TextEditingController();

  String correct = "A";

  @override
  void dispose() {
    questionController.dispose();
    optionA.dispose();
    optionB.dispose();
    optionC.dispose();
    optionD.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Question")),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            TextField(
              controller: questionController,
              decoration: const InputDecoration(labelText: "Question"),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: optionA,
              decoration: const InputDecoration(labelText: "Option A"),
            ),

            TextField(
              controller: optionB,
              decoration: const InputDecoration(labelText: "Option B"),
            ),

            TextField(
              controller: optionC,
              decoration: const InputDecoration(labelText: "Option C"),
            ),

            TextField(
              controller: optionD,
              decoration: const InputDecoration(labelText: "Option D"),
            ),

            const SizedBox(height: 10),

            DropdownButton<String>(
              value: correct,
              items: ["A", "B", "C", "D"]
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      ))
                  .toList(),
              onChanged: (val) {
                setState(() {
                  correct = val!;
                });
              },
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Question Added")),
                );

                // Clear fields
                questionController.clear();
                optionA.clear();
                optionB.clear();
                optionC.clear();
                optionD.clear();

                setState(() {
                  correct = "A";
                });
              },
              child: const Text("Save Question"),
            ),

          ],
        ),
      ),
    );
  }
}
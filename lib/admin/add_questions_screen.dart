import 'package:flutter/material.dart';

class AddQuestionsScreen extends StatelessWidget {

  final questionController = TextEditingController();
  final optionA = TextEditingController();
  final optionB = TextEditingController();
  final optionC = TextEditingController();
  final optionD = TextEditingController();
  String correct = "A";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Question")),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [

            TextField(
              controller: questionController,
              decoration: InputDecoration(labelText: "Question"),
            ),

            TextField(controller: optionA, decoration: InputDecoration(labelText: "Option A")),
            TextField(controller: optionB, decoration: InputDecoration(labelText: "Option B")),
            TextField(controller: optionC, decoration: InputDecoration(labelText: "Option C")),
            TextField(controller: optionD, decoration: InputDecoration(labelText: "Option D")),

            DropdownButton<String>(
              value: correct,
              items: ["A","B","C","D"].map((e) =>
                  DropdownMenuItem(value: e, child: Text(e))
              ).toList(),
              onChanged: (val){
                correct = val!;
              },
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: (){
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Question Added")));
              },
              child: Text("Save Question"),
            )

          ],
        ),
      ),
    );
  }
}
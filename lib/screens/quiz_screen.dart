import 'package:flutter/material.dart';
import 'result_screen.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {

  int questionIndex = 0;

  List questions = [
    "2 + 2 = ?",
    "5 + 3 = ?"
  ];

  nextQuestion(){
    if(questionIndex < questions.length - 1){
      setState(() {
        questionIndex++;
      });
    } else {
      Navigator.push(context,
          MaterialPageRoute(builder: (_) => ResultScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Quiz")),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Text(questions[questionIndex], style: TextStyle(fontSize: 22)),

          ElevatedButton(onPressed: nextQuestion, child: Text("A")),
          ElevatedButton(onPressed: nextQuestion, child: Text("B")),
          ElevatedButton(onPressed: nextQuestion, child: Text("C")),
          ElevatedButton(onPressed: nextQuestion, child: Text("D")),

        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'quiz_screen.dart';

class ContestScreen extends StatelessWidget {

  final int fee;

  ContestScreen({required this.fee});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("$fee PKR Contest")),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text("Players: 10/20"),

            ElevatedButton(
              child: Text("Join Contest"),
              onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => QuizScreen()));
              },
            )

          ],
        ),
      ),
    );
  }
}
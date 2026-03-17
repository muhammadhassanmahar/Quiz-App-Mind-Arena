import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Result")),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text("🎉 Result", style: TextStyle(fontSize: 24)),
            Text("Rank #3"),
            Text("You won 200 PKR"),

          ],
        ),
      ),
    );
  }
}
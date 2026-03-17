import 'package:flutter/material.dart';

class DepositScreen extends StatelessWidget {

  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Deposit")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [

            Text("Send to: 03001234567"),

            TextField(
              controller: amountController,
              decoration: InputDecoration(labelText: "Amount"),
            ),

            ElevatedButton(
              onPressed: (){
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Deposit Request Sent")));
              },
              child: Text("Submit"),
            )

          ],
        ),
      ),
    );
  }
}
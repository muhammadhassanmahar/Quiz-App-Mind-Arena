import 'package:flutter/material.dart';

class WithdrawScreen extends StatelessWidget {

  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Withdraw")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [

            TextField(
              decoration: InputDecoration(labelText: "Account Number"),
            ),

            TextField(
              controller: amountController,
              decoration: InputDecoration(labelText: "Amount"),
            ),

            ElevatedButton(
              onPressed: (){
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Withdraw Request Sent")));
              },
              child: Text("Withdraw"),
            )

          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class WithdrawScreen extends StatelessWidget {
  // Added key parameter and marked constructor as const
  const WithdrawScreen({Key? key}) : super(key: key);

  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Withdraw")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            const TextField(
              decoration: InputDecoration(labelText: "Account Number"),
            ),

            TextField(
              controller: amountController,
              decoration: const InputDecoration(labelText: "Amount"),
            ),

            ElevatedButton(
              onPressed: (){
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Withdraw Request Sent")));
              },
              child: const Text("Withdraw"),
            )

          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class DepositScreen extends StatelessWidget {
  // Key parameter added
  DepositScreen({super.key});

  final TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Deposit")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            const Text("Send to: 03001234567"),

            TextField(
              controller: amountController,
              decoration: const InputDecoration(labelText: "Amount"),
            ),

            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Deposit Request Sent")),
                );
              },
              child: const Text("Submit"),
            ),

          ],
        ),
      ),
    );
  }
}
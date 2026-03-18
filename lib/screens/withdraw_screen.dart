import 'package:flutter/material.dart';

class WithdrawScreen extends StatefulWidget {
  const WithdrawScreen({Key? key}) : super(key: key);

  @override
  _WithdrawScreenState createState() => _WithdrawScreenState();
}

class _WithdrawScreenState extends State<WithdrawScreen> {
  final TextEditingController accountController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  @override
  void dispose() {
    // Dispose controllers to avoid memory leaks
    accountController.dispose();
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Withdraw")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            TextField(
              controller: accountController,
              decoration: const InputDecoration(labelText: "Account Number"),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: amountController,
              decoration: const InputDecoration(labelText: "Amount"),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Withdraw Request Sent"))
                );
                // Optionally clear fields after submission
                accountController.clear();
                amountController.clear();
              },
              child: const Text("Withdraw"),
            ),

          ],
        ),
      ),
    );
  }
}
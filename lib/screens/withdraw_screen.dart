import 'package:flutter/material.dart';

class WithdrawScreen extends StatefulWidget {
  const WithdrawScreen({super.key}); // ✅ modern super parameter

  @override
  WithdrawScreenState createState() => WithdrawScreenState(); // ✅ public state
}

class WithdrawScreenState extends State<WithdrawScreen> {
  final TextEditingController accountController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  @override
  void dispose() {
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
import 'package:flutter/material.dart';

class DepositRequestsScreen extends StatelessWidget {
  // Added const constructor with super.key
  const DepositRequestsScreen({super.key});

  final List<Map<String, dynamic>> deposits = const [
    {"name": "Ali", "amount": 500},
    {"name": "Ahmed", "amount": 1000},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Deposit Requests")),

      body: ListView.builder(
        itemCount: deposits.length,
        itemBuilder: (context, index) {
          var d = deposits[index];

          return Card(
            child: ListTile(
              title: Text("${d["name"]}"),
              subtitle: Text("Amount: ${d["amount"]}"),

              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [

                  IconButton(
                    icon: const Icon(Icons.check, color: Colors.green),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Approved")),
                      );
                    },
                  ),

                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.red),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Declined")),
                      );
                    },
                  ),

                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
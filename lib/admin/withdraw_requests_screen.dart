import 'package:flutter/material.dart';

class WithdrawRequestsScreen extends StatelessWidget {
  // Added const constructor with super.key
  const WithdrawRequestsScreen({super.key});

  final List<Map<String, dynamic>> withdraws = const [
    {"name": "Bilal", "amount": 300},
    {"name": "Usman", "amount": 700},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Withdraw Requests")),

      body: ListView.builder(
        itemCount: withdraws.length,
        itemBuilder: (context, index) {
          var w = withdraws[index];

          return Card(
            child: ListTile(
              title: Text("${w["name"]}"),
              subtitle: Text("Amount: ${w["amount"]}"),

              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [

                  IconButton(
                    icon: const Icon(Icons.check, color: Colors.green),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Marked Paid")),
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
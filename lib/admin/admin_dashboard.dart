import 'package:flutter/material.dart';
import 'deposit_requests_screen.dart';
import 'withdraw_requests_screen.dart';
import 'users_screen.dart';
import 'add_questions_screen.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({Key? key}) : super(key: key); // Key parameter added

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Admin Dashboard")),

      body: ListView(
        children: [

          ListTile(
            title: const Text("Deposit Requests"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const DepositRequestsScreen()), // const constructor if possible
              );
            },
          ),

          ListTile(
            title: const Text("Withdraw Requests"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const WithdrawRequestsScreen()),
              );
            },
          ),

          ListTile(
            title: const Text("Users"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const UsersScreen()),
              );
            },
          ),

          ListTile(
            title: const Text("Add Questions"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AddQuestionsScreen()),
              );
            },
          ),

        ],
      ),
    );
  }
}
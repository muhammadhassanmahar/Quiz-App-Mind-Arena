import 'package:flutter/material.dart';
import 'deposit_screen.dart';
import 'withdraw_screen.dart';
import 'contest_screen.dart';

class HomeScreen extends StatelessWidget {
  final bool isAdmin;

  // Key parameter added
  const HomeScreen({super.key, required this.isAdmin});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Mind Arena")),

      body: Column(
        children: [

          const SizedBox(height: 20),

          const Text("Wallet: 500 PKR", style: TextStyle(fontSize: 20)),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                child: const Text("Deposit"),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => DepositScreen()));
                },
              ),
              ElevatedButton(
                child: const Text("Withdraw"),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => WithdrawScreen()));
                },
              ),
            ],
          ),

          const SizedBox(height: 20),

          const Text("Contests", style: TextStyle(fontSize: 18)),

          ElevatedButton(
            child: const Text("100 PKR Contest"),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => ContestScreen(fee: 100)));
            },
          ),

          ElevatedButton(
            child: const Text("500 PKR Contest"),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => ContestScreen(fee: 500)));
            },
          ),

          ElevatedButton(
            child: const Text("1000 PKR Contest"),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => ContestScreen(fee: 1000)));
            },
          ),

        ],
      ),
    );
  }
}
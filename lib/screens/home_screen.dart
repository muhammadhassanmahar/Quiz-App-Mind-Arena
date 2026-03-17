import 'package:flutter/material.dart';
import 'deposit_screen.dart';
import 'withdraw_screen.dart';
import 'contest_screen.dart';

class HomeScreen extends StatelessWidget {
  final bool isAdmin;

  // Added key parameter and marked constructor as const
  const HomeScreen({Key? key, required this.isAdmin}) : super(key: key);

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
                      MaterialPageRoute(builder: (_) => const DepositScreen()));
                },
              ),
              ElevatedButton(
                child: const Text("Withdraw"),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const WithdrawScreen()));
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
                  MaterialPageRoute(builder: (_) => const ContestScreen(fee: 100)));
            },
          ),

          ElevatedButton(
            child: const Text("500 PKR Contest"),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const ContestScreen(fee: 500)));
            },
          ),

          ElevatedButton(
            child: const Text("1000 PKR Contest"),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const ContestScreen(fee: 1000)));
            },
          ),

        ],
      ),
    );
  }
}
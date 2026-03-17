import 'package:flutter/material.dart';
import 'deposit_screen.dart';
import 'withdraw_screen.dart';
import 'contest_screen.dart';

class HomeScreen extends StatelessWidget {

  final bool isAdmin;

  HomeScreen({required this.isAdmin});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mind Arena")),

      body: Column(
        children: [

          SizedBox(height: 20),

          Text("Wallet: 500 PKR", style: TextStyle(fontSize: 20)),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                child: Text("Deposit"),
                onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => DepositScreen()));
                },
              ),
              ElevatedButton(
                child: Text("Withdraw"),
                onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => WithdrawScreen()));
                },
              ),
            ],
          ),

          SizedBox(height: 20),

          Text("Contests", style: TextStyle(fontSize: 18)),

          ElevatedButton(
            child: Text("100 PKR Contest"),
            onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => ContestScreen(fee: 100)));
            },
          ),

          ElevatedButton(
            child: Text("500 PKR Contest"),
            onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => ContestScreen(fee: 500)));
            },
          ),

          ElevatedButton(
            child: Text("1000 PKR Contest"),
            onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => ContestScreen(fee: 1000)));
            },
          ),

        ],
      ),
    );
  }
}
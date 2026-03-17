import 'package:flutter/material.dart';
import 'deposit_requests_screen.dart';
import 'withdraw_requests_screen.dart';
import 'users_screen.dart';
import 'add_questions_screen.dart';

class AdminDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Admin Dashboard")),

      body: ListView(
        children: [

          ListTile(
            title: Text("Deposit Requests"),
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => DepositRequestsScreen()));
            },
          ),

          ListTile(
            title: Text("Withdraw Requests"),
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => WithdrawRequestsScreen()));
            },
          ),

          ListTile(
            title: Text("Users"),
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => UsersScreen()));
            },
          ),

          ListTile(
            title: Text("Add Questions"),
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => AddQuestionsScreen()));
            },
          ),

        ],
      ),
    );
  }
}
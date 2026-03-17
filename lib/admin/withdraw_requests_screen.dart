import 'package:flutter/material.dart';

class WithdrawRequestsScreen extends StatelessWidget {

  final List withdraws = [
    {"name": "Bilal", "amount": 300},
    {"name": "Usman", "amount": 700},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Withdraw Requests")),

      body: ListView.builder(
        itemCount: withdraws.length,
        itemBuilder: (context, index){

          var w = withdraws[index];

          return Card(
            child: ListTile(
              title: Text("${w["name"]}"),
              subtitle: Text("Amount: ${w["amount"]}"),

              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [

                  IconButton(
                    icon: Icon(Icons.check, color: Colors.green),
                    onPressed: (){
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Marked Paid")));
                    },
                  ),

                  IconButton(
                    icon: Icon(Icons.close, color: Colors.red),
                    onPressed: (){
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Declined")));
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
import 'package:flutter/material.dart';

class UsersScreen extends StatefulWidget {
  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {

  List users = [
    {"name": "Ali", "wallet": 500},
    {"name": "Ahmed", "wallet": 1000},
  ];

  void addBalance(int index){
    setState(() {
      users[index]["wallet"] += 100;
    });
  }

  void removeBalance(int index){
    setState(() {
      users[index]["wallet"] -= 100;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Users")),

      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index){

          var u = users[index];

          return Card(
            child: ListTile(
              title: Text("${u["name"]}"),
              subtitle: Text("Wallet: ${u["wallet"]}"),

              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [

                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () => addBalance(index),
                  ),

                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () => removeBalance(index),
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
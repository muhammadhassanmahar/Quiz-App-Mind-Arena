import 'package:flutter/material.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {

  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mind Arena Login")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [

            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: "Email"),
            ),

            TextField(
              controller: passController,
              decoration: InputDecoration(labelText: "Password"),
              obscureText: true,
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {

                String email = emailController.text;

                // simple admin check
                if(email == "immaharhasaan@gmail.com"){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => HomeScreen(isAdmin: true)));
                } else {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => HomeScreen(isAdmin: false)));
                }

              },
              child: Text("Login"),
            )

          ],
        ),
      ),
    );
  }
}
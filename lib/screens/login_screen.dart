import 'package:flutter/material.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  // Added key parameter and marked constructor as const
  const LoginScreen({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Mind Arena Login")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: "Email"),
            ),

            TextField(
              controller: passController,
              decoration: const InputDecoration(labelText: "Password"),
              obscureText: true,
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                String email = emailController.text;

                // simple admin check
                if(email == "immaharhasaan@gmail.com"){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const HomeScreen(isAdmin: true)));
                } else {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const HomeScreen(isAdmin: false)));
                }
              },
              child: const Text("Login"),
            )

          ],
        ),
      ),
    );
  }
}
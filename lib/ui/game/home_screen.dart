import 'package:flutter/material.dart';
import 'package:smash_it/controllers/auth_controller.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Cric Fantasy League Home"),
            TextButton(
              onPressed: () {
                AuthController.to.signOut();
              },
              child: const Text('Sign out'),
            ),
          ],
        ),
      ),
    );
  }
}

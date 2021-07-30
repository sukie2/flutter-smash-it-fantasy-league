import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Cric Fantasy League"),
          TextButton(onPressed: () {}, child: Text('Login')),
          TextButton(onPressed: () {}, child: Text('Sign up'))
        ],
      ),
    );
  }
}

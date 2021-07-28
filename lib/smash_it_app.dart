import 'package:flutter/material.dart';
import 'package:smash_it/ui/auth/sign_up_screen.dart';

class SmashItApp extends StatefulWidget {
  const SmashItApp({Key? key}) : super(key: key);

  @override
  _SmashItAppState createState() => _SmashItAppState();
}

class _SmashItAppState extends State<SmashItApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SignUpScreen(),
      ),
    );
  }
}

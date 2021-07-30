import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smash_it/ui/auth/sign_up_screen.dart';

class SmashItApp extends StatefulWidget {
  @override
  _SmashItAppState createState() => _SmashItAppState();
}

class _SmashItAppState extends State<SmashItApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        body: SignUpScreen(),
      ),
    );
  }
}

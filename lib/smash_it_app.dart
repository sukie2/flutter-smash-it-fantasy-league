import 'package:flutter/material.dart';
import 'package:smash_it/theme/themes.dart';
import 'package:smash_it/ui/auth/sign_up_screen.dart';

class SmashItApp extends StatefulWidget {
  const SmashItApp({Key? key}) : super(key: key);

  @override
  _SmashItAppState createState() => _SmashItAppState();
}

class _SmashItAppState extends State<SmashItApp> {
  @override
  void initState() {
    super.initState();
    currentTheme.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      themeMode: currentTheme.currentTheme,
      home: Scaffold(
        body: SignUpScreen(),
      ),
    );
  }
}

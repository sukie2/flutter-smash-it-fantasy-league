import 'package:flutter/material.dart';

CustomTheme currentTheme = CustomTheme();

class CustomTheme with ChangeNotifier {
  static bool _isDarkTheme = false;
  ThemeMode get currentTheme => _isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }

  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: Colors.blue[600],
      backgroundColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.blue),
          bodyText2: TextStyle(color: Colors.blue)),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: Colors.black12,
      backgroundColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
    );
  }
}

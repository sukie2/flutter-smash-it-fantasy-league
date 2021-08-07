import 'package:get/get.dart';
import 'package:smash_it/ui/auth/login_screen.dart';
import 'package:smash_it/ui/auth/sign_up_screen.dart';
import 'package:smash_it/ui/home/home_screen.dart';
import 'package:smash_it/ui/splash_screen.dart';

class AppRoutes {
  AppRoutes._();
  static final routes = [
    GetPage(name: '/', page: () => SplashScreen()),
    GetPage(name: '/login', page: () => LoginScreen()),
    GetPage(name: '/signup', page: () => SignUpScreen()),
    GetPage(name: '/home', page: () => HomeScreen())
  ];
}

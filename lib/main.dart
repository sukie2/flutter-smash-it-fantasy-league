import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smash_it/controllers/home_controller.dart';
import 'package:smash_it/controllers/profile_controller.dart';
import 'package:smash_it/ui/smash_it_app.dart';

import 'controllers/auth_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put<AuthController>(AuthController());
  Get.put<HomeController>(HomeController());
  Get.put<ProfileController>(ProfileController());
  runApp(SmashItApp());
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/app_routes.dart';

class SmashItApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: "/",
      getPages: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}

import 'package:get/get.dart';
import 'package:smash_it/controllers/home_controller.dart';

class HomeScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
  }
}

import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController to = Get.find();
  var tabIndex = 0;

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }
}

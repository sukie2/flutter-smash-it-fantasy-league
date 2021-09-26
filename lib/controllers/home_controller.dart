import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController to = Get.find();
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  var tabIndex = 0.obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
    getUpComingSeries();
  }

  Future<void> getUpComingSeries() async {
    final QuerySnapshot result = await _db.collection('series').get();
    final List<DocumentSnapshot> documents = result.docs;
  }

  Future<List<DocumentSnapshot>> getData() async {
    final QuerySnapshot result = await _db.collection('series').get();
    return result.docs;
  }
}

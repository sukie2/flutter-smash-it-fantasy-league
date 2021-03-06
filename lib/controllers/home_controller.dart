import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController to = Get.find();
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  var pageController = PageController(initialPage: 0, keepPage: true).obs;
  var page = 0.obs;

  onPageChanged(input) {
    page.value = input;
  }

  jumpTo(int page) {
    if (pageController.value.hasClients) pageController.value.jumpToPage(page);
  }

  animateTo(int page) {
    if (pageController.value.hasClients)
      pageController.value.animateToPage(page,
          duration: Duration(milliseconds: 300), curve: Curves.easeIn);
  }

  resetController(int page) {
    pageController.value = PageController(initialPage: page);
  }

  Future<void> getUpComingSeries() async {
    final QuerySnapshot result = await _db.collection('series').get();
    final List<DocumentSnapshot> documents = result.docs;
  }

  Stream<QuerySnapshot> getMatches() {
    return _db.collection('matches').snapshots();
  }

  Stream<QuerySnapshot> getPlayerData() {
    return _db
        .collection('players')
        .orderBy('points', descending: true)
        .snapshots();
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ProfileController extends GetxController {
  static ProfileController to = Get.find();
  CollectionReference userProfileCollection =
      FirebaseFirestore.instance.collection('user_profile');
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late Map<String, dynamic> userProfile;

  @override
  void onInit() async {
    //run every time auth state changes
    var userId = _auth.currentUser?.uid;
    if(userId != null){
      userProfile = await loadUserProfile(userId);
    }
    super.onInit();
  }

  Future<Map<String, dynamic>> loadUserProfile(String uid) async {
    var querySnapshot =
        await userProfileCollection.where('user_id', isEqualTo: '${uid}').get();
    if (querySnapshot.docs.isNotEmpty) {
      QueryDocumentSnapshot queryDocumentSnapshot = querySnapshot.docs.first;
      return queryDocumentSnapshot.data() as Map<String, dynamic>;
    } else {
      return new Map();
    }
  }

  createUserProfile(String uid, String name) async {
    return await userProfileCollection.add({
      'name': name,
      'country_code': "SG",
      'image_url': null,
      'points': 0,
      'rank': 1001,
      'battles': 0,
      'updated_at': FieldValue.serverTimestamp(),
      'user_id': uid
    });
  }

  ImageProvider? getProfileImage() {
    if (userProfile['image_url'] == null) {
      return AssetImage('images/spider_man.jpg');
    } else {
      return NetworkImage('${userProfile['image_url']}');
    }
  }

  String getProfileName() {
    return userProfile['name'] != null ? userProfile['name'] : 'Anonymous';
  }

  int getBattleCount() {
    return userProfile['battles'] != null ? userProfile['battles'] : 0;
  }

  int getPoints() {
    return userProfile['points'] != null ? userProfile['points'] : 0;
  }

  int getRank() {
    return userProfile['rank'] != null ? userProfile['rank'] : 1001;
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:smash_it/models/user_model.dart';
import 'package:smash_it/ui/auth/login_screen.dart';
import 'package:smash_it/ui/dashboard_screen.dart';

class AuthController extends GetxController {
  static AuthController to = Get.find();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Rxn<User> firebaseUser = Rxn<User>();
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  // Firebase user a realtime stream
  Stream<User?> get user => _auth.authStateChanges();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void onReady() async {
    //run every time auth state changes
    ever(firebaseUser, handleAuthChanged);
    firebaseUser.bindStream(user);
    super.onReady();
  }

  // User registration using email and password
  Future<bool> registerWithEmailAndPassword(BuildContext context) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text)
          .then((result) async {
        //create the new user object
        UserModel _newUser = UserModel(
            uid: result.user!.uid,
            email: result.user!.email!,
            name: nameController.text);

        // create the user in firestore
        await _createUserFirestore(_newUser, result.user!);
        emailController.clear();
        passwordController.clear();
        nameController.clear();
      });
      return true;
    } on FirebaseAuthException catch (error) {
      return false;
    }
  }

  //Method to handle user sign in using email and password
  Future<bool> signInWithEmailAndPassword(BuildContext context) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
      emailController.clear();
      passwordController.clear();
      return true;
    } catch (error) {
      return false;
    }
  }

  Future<void> _createUserFirestore(UserModel user, User _firebaseUser) async {
    _db.doc('/users/${_firebaseUser.uid}').set(user.toJson());
    update();
  }

  handleAuthChanged(_firebaseUser) async {
    //get user data from firestore
    await Future.delayed(Duration(seconds: 4));
    if (_firebaseUser == null) {
      Get.offAll(LoginScreen());
    } else {
      Get.offAll(DashboardScreen());
    }
  }

  // Sign out
  Future<void> signOut() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    return _auth.signOut();
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}

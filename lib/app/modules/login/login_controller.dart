import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:remindmi/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginController extends GetxController {
  final getStorge = GetStorage();
  final _auth = FirebaseAuth.instance;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  login(String email, String password) {
    // getStorge.write("id", 1);
    // getStorge.write("name", "Ripples Code");
    // Get.offAllNamed(Routes.HOME);
    print(
        "####################################################################################################login function is called");
    loginUsingEmailPassword(email, password);
  }

  Future<User?> loginUsingEmailPassword(
    String email,
    String password,
  ) async {
    print(
        "####################################################################################################login 2 function is called");

    FirebaseAuth auth = FirebaseAuth.instance;
    print(auth);
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
      print(
          "####################################################################################################user found");

      print(user);
      route();
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("NO User found for that email");
      } else if (e.code == 'wrong-password') ;
    }
  }

  void route() {
    User? user = FirebaseAuth.instance.currentUser;
    var kk = FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        // if (documentSnapshot.get('role') == "parent") {
        getStorge.write("id", user.uid);
        getStorge.write("email", user.email);
        getStorge.write("role", documentSnapshot.get('role'));
        print(
            "###################################################################");
        print(getStorge.read("role"));
        Get.offAllNamed(Routes.HOME);
        // } else {
        //   Get.offAllNamed(Routes.CHILDRENHOME);
        // }
      } else {
        print('Document does not exist on the database');
      }
    });
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:remindmi/app/routes/app_pages.dart';

class SignupController extends GetxController {
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

  // login() {
  //   getStorge.write("id", 1);
  //   getStorge.write("name", "Ripples Code");
  //   Get.offAllNamed(Routes.HOME);
  // }




  void signUp(String email, String password, String role) async {
    // CircularProgressIndicator();
    // if (_formkey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFirestore(email, role)})
          .catchError((e) {});
    // }
  }

  postDetailsToFirestore(String email, String role) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    var user = _auth.currentUser;
    CollectionReference ref = FirebaseFirestore.instance.collection('users');
    ref.doc(user!.uid).set({'email': email, 'role': 'children'});
    print("################################################################### post details to fire store");

  }
}


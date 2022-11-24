import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:remindmi/app/helper/show_custome_snack_bar.dart';
import 'package:remindmi/app/routes/app_pages.dart';

class AddDependentController extends GetxController {
  final getStorge = GetStorage();
  var emailError = "".obs;
  final _auth = FirebaseAuth.instance;
  var passwordVisibility = true.obs;
  var cPasswordVisibility = true.obs;
  var isLoading = false.obs;
  var termChecked = false.obs;
  var isSuccess = false.obs;

  RegExp pass_valid = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");

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

  TogglePasswordVisibility() {
    //used for eyebutton on textfield
    if (passwordVisibility.value == true) {
      passwordVisibility.value = false;
    } else {
      passwordVisibility.value = true;
    }
  }

  ToggleCPasswordVisibility() {
    //used for eyebutton on textfield

    if (cPasswordVisibility.value == true) {
      cPasswordVisibility.value = false;
    } else {
      cPasswordVisibility.value = true;
    }
  }

  ToggleTermChecked() {
    //used for checked box button on terms and conditions
    if (termChecked.value == true) {
      termChecked.value = false;
    } else {
      termChecked.value = true;
    }
  }

  void addDependent(String fullName, String email, String password,
      String CPassword, String role) async {
// takes data from view and create account with role 'dependent'

    isLoading.value = true;

    if (termChecked.value == true) {
      if (fullName != '') {
        if (password == CPassword) {
          if (pass_valid.hasMatch(password)) {
            await _auth
                .createUserWithEmailAndPassword(
                    email: email, password: password)
                .then(
                    (value) => {postDetailsToFirestore(fullName, email, role)})
                .catchError((e) {
              if (e.code == 'email-already-in-use') {
                isLoading.value = false;

                showCustomSnackBar("User already registered", title: "Email");
              } else if (e.code == 'unknown') {
                isLoading.value = false;
                showCustomSnackBar("Please fill all the fields",
                    title: "Error");
              } else {
                isLoading.value = false;
                showCustomSnackBar(e.code, title: "Error");
              }
            });
          } else {
            isLoading.value = false;
            showCustomSnackBar(
                "Password should contain a capital and lowercase letter, number and special character!",
                title: "Error");
          }
        } else {
          isLoading.value = false;
          showCustomSnackBar("'Confirm Password' didn't match!",
              title: "Error");
        }
      } else {
        isLoading.value = false;
        showCustomSnackBar("Please fill all the fields", title: "Error");
      }
    } else {
      isLoading.value = false;
      showCustomSnackBar("Please accept the terms and condition first!",
          title: "Terms & Condition");
    }
  }

  postDetailsToFirestore(String fullName, String email, String role) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    var user = _auth.currentUser;
    CollectionReference ref = FirebaseFirestore.instance.collection('users');
    isLoading.value = false;
    showCustomSnackBarSuccess("Account created successfully", title: "Success");

    ref.doc(user!.uid).set({
      'parent': getStorge.read('id'),
      'fullName': fullName,
      'email': email,
      'role': role
    });

    isSuccess.value = true;
    Get.offAllNamed(Routes.BOTTOMNAVIGATIION);
    //after all process page is navigated to home of parent
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:remindmi/app/helper/show_custome_snack_bar.dart';
import 'package:remindmi/app/modules/login/login_view.dart';
import 'package:remindmi/app/modules/signup/signup_view.dart';
import 'package:remindmi/app/routes/app_pages.dart';

class SignupController extends GetxController {
  final getStorge = GetStorage();
  final _auth = FirebaseAuth.instance;

  var emailError = "".obs;

  var passwordVisibility = true.obs;
  var cPasswordVisibility = true.obs;
  var isLoading = false.obs;
  var termChecked = false.obs;
  var isSuccess = false.obs;

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
    if (passwordVisibility.value == true) {
      passwordVisibility.value = false;
    } else {
      passwordVisibility.value = true;
    }
  }

  ToggleCPasswordVisibility() {
    if (cPasswordVisibility.value == true) {
      cPasswordVisibility.value = false;
    } else {
      cPasswordVisibility.value = true;
    }
  }

  ToggleTermChecked() {
    if (termChecked.value == true) {
      termChecked.value = false;
    } else {
      termChecked.value = true;
    }
    print("term is clicked");
    print(termChecked);
  }

  void signUp(
      String fullName, String email, String password, String CPassword) async {
    isLoading.value = true;

    print(fullName);
    if (termChecked.value == true) {
      if (fullName != '') {
        if (password == CPassword) {
          await _auth
              .createUserWithEmailAndPassword(email: email, password: password)
              .then((value) =>
                  {postDetailsToFirestore(fullName, email, 'parent')})
              .catchError((e) {
            print("#############################################");
            print(e);
            if (e.code == 'email-already-in-use') {
              isLoading.value = false;

              // emailError.value = "User Already Registered !";
              showCustomSnackBar("User Already Registered", title: "Email");
            } else if (e.code == 'unknown') {
              isLoading.value = false;
              showCustomSnackBar("Please fill all the fields", title: "Error");
            } else {
              isLoading.value = false;
              showCustomSnackBar(e.code, title: "Error");
            }
          });
        } else {
          isLoading.value = false;
          showCustomSnackBar("Confirm Password didn't matched !",
              title: "Error");
        }
      } else {
        isLoading.value = false;
        showCustomSnackBar("Please fill all the fields", title: "Error");
      }
    } else {
      isLoading.value = false;
      showCustomSnackBar("Please accept the terms and condition first! ",
          title: "Terms & Condition");
    }
  }

  postDetailsToFirestore(String fullName, String email, String role) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    var user = _auth.currentUser;
    CollectionReference ref = FirebaseFirestore.instance.collection('users');
    isLoading.value = false;
    showCustomSnackBarSuccess("Account created successfully", title: "success");

    ref
        .doc(user!.uid)
        .set({'fullName': fullName, 'email': email, 'role': role});
    print(
        "################################################################### post details to fire store");
    isSuccess.value = true;
    Get.offAllNamed(Routes.LOGIN);
  }
}

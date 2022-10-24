import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:remindmi/app/helper/show_custome_snack_bar.dart';
import 'package:remindmi/app/routes/app_pages.dart';

class LoginController extends GetxController {
  final getStorge = GetStorage();
  final _auth = FirebaseAuth.instance;
  var emailError = "".obs;
  var passwordError = "".obs;
  var extraError = "".obs;
  var isEmailError = false.obs;
  var isPasswordError = false.obs;
  var isExtraError = false.obs;

  var passwordVisible = true.obs;
  var isLoading = false.obs;
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
    if (passwordVisible.value == true) {
      passwordVisible.value = false;
    } else {
      passwordVisible.value = true;
    }
  }

  changeEmailText() {
    isEmailError.value = false;
    isExtraError.value = false;
  }

  changePasswordText() {
    isPasswordError.value = false;
    isExtraError.value = false;
  }

  login(String email, String password) {
    loginUsingEmailPassword(email, password);
    isLoading.value = true;
  }

  Future<User?> loginUsingEmailPassword(
    String email,
    String password,
  ) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    print(auth);
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
      isLoading.value = false;
      print(user);
      route();
      showCustomSnackBarSuccess("login successfull", title: "success");
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        emailError.value = "User not found !";
        showCustomSnackBar("User not found", title: "Email");
        isEmailError.value = true;
      } else if (e.code == "invalid-email") {
        isEmailError.value = true;
        showCustomSnackBar("Format error", title: "Email");
        emailError.value = 'format error !';
      } else if (e.code == 'wrong-password') {
        isPasswordError.value = true;
        showCustomSnackBar("Incorrect Password", title: "Password");
        passwordError.value = 'Incorrect password';
      } else if (e.code == 'unknown') {
        isExtraError.value = true;
        showCustomSnackBar("Please fill all the fields", title: "Error");
        extraError.value = 'Please fill all the fields';
      } else {
        isExtraError.value = true;
        showCustomSnackBar(e.code, title: "Error");
        extraError.value = e.code;
      }
      isLoading.value = false;
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
        getStorge.write("fullName", documentSnapshot.get('fullName'));
        getStorge.write("email", user.email);
        getStorge.write("role", documentSnapshot.get('role'));
        Get.offAllNamed(Routes.HOME);
        // keep this for usa
        // Get.offAllNamed(Routes.BOTTOMNAVIGATION);
      } else {
        print('Something went wrong');
      }
    });
  }
}

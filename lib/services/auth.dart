import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future signInAnon() async {
    try {
      // AuthResult result = await _auth.signInAnonymously();
      UserCredential userCredential = await _auth.signInAnonymously();
      final user = userCredential.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}

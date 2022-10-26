import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../routes/app_pages.dart';

class AunthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  Stream<User?> StreamAuthStatus() {
    return auth.authStateChanges();
  }

  void signup(String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.offAllNamed(Routes.HOME);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('The password provided is to weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account alredy exist for the email.');
      }
    } catch (e) {
      print(e);
    }
  }

  void login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.offAllNamed(Routes.HOME);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'Wrong-password') {
        print('Wrong passord provided fot that user.');
      }
    } catch (e) {
      print(e);
    }
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }
}

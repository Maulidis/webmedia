import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../routes/app_pages.dart';

class AunthController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  // final GlobalKey<FormState> _fromkey = GlobalKey<FormState>();
  final firestoreInstance = FirebaseFirestore.instance;

  Stream<User?> StreamAuthStatus() {
    return auth.authStateChanges();
  }

  void signup(
      String nama,
      String email,
      String password,
      String passwordConfirm,
      String alamat,
      String noHp,
      String tgl_lahir,
      String jenis_kelamin) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    // User? user;
    try {
       await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      var firebaseUser = FirebaseAuth.instance.currentUser;
      firestoreInstance.collection("users").doc(firebaseUser!.uid).set({
        "name": nama,
        "tanggal lahir": tgl_lahir,
        "jenis kelamin": jenis_kelamin,
        "email": email,
        "no hp": noHp,
        "alamat": alamat,
      }).then((value) {
        print("success!");

        var firebaseUser = FirebaseAuth.instance.currentUser;
        firestoreInstance
            .collection("users")
            .doc(firebaseUser!.uid)
            .get()
            .then((value) {
          print(value.data());
        });
      });
      // user = userCredential.user;
      // // ignore: deprecated_member_use
      // await user!.updateProfile(displayName: nama);
      // await user.reload();
      // user = auth.currentUser;

      Get.offAllNamed(Routes.HOME);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('The password provided is to weak.');
      } else if (e.code == 'emai-already-in-use') {
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
      var firebaseUser = FirebaseAuth.instance.currentUser;
      firestoreInstance
          .collection("users")
          .doc(firebaseUser!.uid)
          .get()
          .then((value) {
        print(value.data());
      });
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

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webmedia/app/data/providers/api.dart';
import '../home.dart';
import '../routes/app_pages.dart';

class AunthController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  // final GlobalKey<FormState> _fromkey = GlobalKey<FormState>();
  final firestoreInstance = FirebaseFirestore.instance;
  final formKey = GlobalKey<FormState>();

  Stream<User?> StreamAuthStatus() {
    return auth.authStateChanges();
  }

  void signup(
      String nama,
      String email,
      String password,
      String passwordConfirm,
      String alamat,
      String no_tlp,
      String tgl_lahir,
      String jenis_kelamin
      ) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    // User? user;
    try {
      UserCredential myUser = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await myUser.user!.sendEmailVerification();
      Get.defaultDialog(
        title: "Verivication Email",
        middleText: "Kami telah mengirimkan email verivikasi ke $email.",
        onConfirm: (){
          Get.back(); // close dialog
          Get.back(); // go to login
        },
        textConfirm: "ya, saya akan cek email",
      );
        //post database
      var map = new Map<String, dynamic>();
      map['nama'] = nama;
      map['tgl_lahir'] = tgl_lahir;
      map['jenis_kelamin'] = jenis_kelamin;
      map['email'] = email;
      map['password'] = password;
      map['no_tlp'] = no_tlp;
      map['alamat'] = alamat;

      final response = await http.post(
        Uri.parse(REGISTRATION),
        body: map,
      );

      print(response.body);
      
      //cloud firebase
      // var firebaseUser = FirebaseAuth.instance.currentUser;
      // firestoreInstance.collection("users").doc(firebaseUser!.uid).set({
      //   "name": nama,
      //   "tanggal lahir": tgl_lahir,
      //   "jenis kelamin": jenis_kelamin,
      //   "email": email,
      //   "no hp": noHp,
      //   "alamat": alamat,
      // }).then((value) {
      //   print("success!");

      //   var currentUser = FirebaseAuth.instance.currentUser;

      //   if (currentUser != null) {
      //     print(currentUser.uid);
      //   }

      //   var firebaseUser = FirebaseAuth.instance.currentUser;
      //   firestoreInstance
      //       .collection("users")
      //       .doc(firebaseUser!.uid)
      //       .get()
      //       .then((value) {
      //     print(value.data());
      //   });
      // });

      //displayname
      // user = userCredential.user;
      // ignore: deprecated_member_use
      // await user!.updateProfile(displayName: nama);
      // await user.reload();
      // user = auth.currentUser;

      Get.offAllNamed(Routes.HOME);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'week passsword') {
        print('The password provided is to weak.');
        Get.defaultDialog(
          title: "Terjadi kesalahan",
          middleText: "The password provided is to weak.",
        );
      } else if (e.code == 'emai-already-in-use') {
        print('The account alredy exist for the email.');
        Get.defaultDialog(
          title: "Terjadi kesalahan",
          middleText: "The account alredy exist for the email.",
        );
      }
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi kesalahan",
        middleText: "Tidak dapat mendaftarkan akun ini.",
      );
    }
  }

  void login(
    String email,
    String password,
  ) async {
    try {
      UserCredential myUser = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
        //cloud firebase
      // var firebaseUser = FirebaseAuth.instance.currentUser;
      // firestoreInstance
      //     .collection("users")
      //     .doc(firebaseUser!.uid)
      //     .get()
      //     .then((value) {
      //   print(value.data());
      // });
      // var currentUser = FirebaseAuth.instance.currentUser;

      // if (currentUser != null) {
      //   print(currentUser.uid);
      // }
      if(myUser.user!.emailVerified){
        Get.offAllNamed(Routes.HOME);
      }else{
        Get.defaultDialog(
          title: "Verification Email",
          middleText: "Kamu perlu verifikasi email terlebih dahulu. Apakah anda ingin dikirimkan verifikasi ulang",
          onConfirm: ()async{
            await myUser.user!.sendEmailVerification();
            Get.back();
          },
          textConfirm: "Kirim Ulang",
          textCancel: "kembali"
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
         Get.defaultDialog(
          title: "Terjadi kesalahan",
          middleText: "No user found for that email.",
        );
      } else if (e.code == 'Wrong-password') {
        print('Wrong passord provided fot that user.');
        Get.defaultDialog(
          title: "Terjadi kesalahan",
          middleText: "Wrong passord provided fot that user.",
        );
      }
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi kesalahan",
        middleText: "Tidak dapat login dengan akun ini.",
      );
    }
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }
}

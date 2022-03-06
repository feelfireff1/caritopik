import 'package:caritopik/app/modules/login/controllers/login_controller.dart';
import 'package:caritopik/app/modules/register/controllers/register_controller.dart';
import 'package:caritopik/app/routes/app_pages.dart';
import 'package:caritopik/app/utils/checker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  final registerC = Get.put(RegisterController());
  final loginC = Get.put(LoginController());

  Stream<User?> streamAuthStatus() {
    return auth.authStateChanges();
  }

  // Login -------------------
  var loginErrorMessage = ''.obs;
  var isLoginError = false.obs;
  login(String email, String password) async {
    try {
      UserCredential credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      isLoginError.value = false;
      if (credential.user!.emailVerified == true) {
        loginC.cleanLoginForm();
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.defaultDialog(
          title: 'kamu perlu verifikasi email',
          middleText: 'Apakah kami perlu mengirimkan kembali email verifikasi?',
          onConfirm: () async {
            await credential.user!.sendEmailVerification();
            registerC.sendTimes.value++;
          },
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        isLoginError.value = true;
        loginErrorMessage.value = 'Tidak ada pengguna dengan email tersebut.';
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        isLoginError.value = true;
        loginErrorMessage.value = 'Password salah untuk pengguna tersebut.';
      }
    }
  }
  // -----------------------

  // Register --------------

  var registerErrorMessage = ''.obs;
  var isRegisterError = false.obs;
  registerUserInfoValidation({required String username, required fullName}) {
    if (Checker.isAllSpaces(username)) {
      registerErrorMessage.value = 'Anda harus memasukkan username.';
      isRegisterError.value = true;
    } else {
      isRegisterError.value = false;
    }
    if (Checker.isAllSpaces(fullName)) {
      registerErrorMessage.value = 'Anda harus memasukkan nama lengkap.';
      isRegisterError.value = true;
    } else {
      isRegisterError.value = false;
    }
  }

  register({required String email, required String password, required String username, required fullName}) async {
    registerUserInfoValidation(username: username, fullName: fullName);
    if (isRegisterError.value == false) {
      try {
        UserCredential credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
        CollectionReference<Map<String, dynamic>> usersCollection = FirebaseFirestore.instance.collection('users');
        usersCollection.add({
          'username': username,
          'full_name': fullName,
          'created_date': DateTime.now().toIso8601String(),
        });
        await credential.user!.sendEmailVerification();
        isRegisterError.value = false;
        Get.defaultDialog(
          title: 'email verifikasi terkirim',
          content: Text('kami telah mengirimkan email verifikasi, anda perlu memverifikasinya terlebih dahulu dengan mengecek email yang masuk di email anda'),
          onConfirm: () {
            Get.back(); // close dialog
            registerC.cleanRegisterForm();
          },
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
          registerErrorMessage.value = 'Password tersebut terlalu lemah.';
          isRegisterError.value = true;
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
          registerErrorMessage.value = 'Sudah ada akun yang menggunakan email tersebut.';
          isRegisterError.value = true;
        }
      } catch (e) {
        print(e);
      }
    }
  }

  logout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(Routes.WELCOME);
  }
}

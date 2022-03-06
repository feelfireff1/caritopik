import 'package:get/get.dart';
import 'package:flutter/material.dart';

class RegisterController extends GetxController {
  RxInt sendTimes = 0.obs;

  final usernameC = TextEditingController();
  final fullNameC = TextEditingController();
  final emailC = TextEditingController();
  final passwordC = TextEditingController();
  final rePasswordC = TextEditingController();

  var passwordValue = ''.obs;
  var rePasswordValue = ''.obs;
  var showPasswordError = false.obs;
  String passwordNotMatchMessage = 'passowrd tidak sama';

  RxBool obsecureTextPassword = true.obs;
  RxBool obsecureTextRePassword = true.obs;

  changeObsecureTextPassword() {
    print('called');
    if (obsecureTextPassword.value == false) {
      obsecureTextPassword.value = true;
    } else {
      obsecureTextPassword.value = false;
    }
    print(obsecureTextPassword.value);
  }

  changeObsecureTextRePassword() {
    print('called');
    if (obsecureTextRePassword.value == false) {
      obsecureTextRePassword.value = true;
    } else {
      obsecureTextRePassword.value = false;
    }
    print(obsecureTextRePassword.value);
  }

  cleanRegisterForm() {
    emailC.clear();
    passwordC.clear();
    usernameC.clear();
    fullNameC.clear();
  }

  @override
  void onClose() {
    super.onClose();
    emailC.dispose();
    passwordC.dispose();
  }

  @override
  void onInit() {
    // password & repassword checking
    passwordC.addListener(() {
      passwordValue.value = passwordC.text;
    });

    rePasswordC.addListener(() {
      rePasswordValue.value = rePasswordC.text;
    });

    debounce(rePasswordValue, (_) {
      if (rePasswordValue == passwordValue) {
        showPasswordError.value = false;
      } else {
        showPasswordError.value = true;
      }
    }, time: Duration(seconds: 1));

    debounce(passwordValue, (_) {
      if (passwordValue == rePasswordValue) {
        showPasswordError.value = false;
      } else {
        showPasswordError.value = true;
      }
    }, time: Duration(seconds: 1));
    // -----------------------------

    super.onInit();
    sendTimes.listen((p0) {
      print(p0);
    });
  }
}

import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LoginController extends GetxController {
  final emailC = TextEditingController();
  final passwordC = TextEditingController();
  RxBool obsecureText = true.obs;

  changeObsecureText() {
    if (obsecureText.value == false) {
      obsecureText.value = true;
    } else {
      obsecureText.value = false;
    }
    print(obsecureText.value);
  }

  cleanLoginForm() {
    emailC.clear();
    passwordC.clear();
  }

  @override
  void onClose() {
    super.onClose();
    emailC.dispose();
    passwordC.dispose();
  }

  @override
  void onInit() {
    super.onInit();
  }
}

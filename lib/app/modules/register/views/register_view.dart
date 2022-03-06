import 'package:caritopik/app/controllers/auth_controller.dart';
import 'package:caritopik/app/routes/app_pages.dart';
import 'package:caritopik/app/utils/app_color.dart';
import 'package:caritopik/app/utils/widgets/error_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Daftar',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w600,
            fontFamily: 'poppins',
          ),
        ),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: SvgPicture.asset('assets/icons/Arrow-left.svg', color: Colors.black),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background-secondary.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 24),
          physics: BouncingScrollPhysics(),
          children: [
            // Section 1 - Header
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 12),
              child: Text(
                'Hai, Selamat Datang Kembali ! 😁',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'poppins',
                  fontSize: 24,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 32),
              child: Text(
                'Anda perlu login untuk melanjutkan.',
                style: TextStyle(color: Colors.black.withOpacity(0.7), fontSize: 12, height: 150 / 100),
              ),
            ),
            // Section 2 - Form

            // Username
            TextField(
              autofocus: false,
              controller: controller.usernameC,
              decoration: InputDecoration(
                hintText: '@yourusername',
                prefixIcon: Container(
                  padding: EdgeInsets.all(12),
                  child: SvgPicture.asset('assets/icons/Profile.svg', color: Colors.black),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColor.secondary, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColor.primary, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            SizedBox(height: 16),

            // Full Name
            TextField(
              autofocus: false,
              controller: controller.fullNameC,
              decoration: InputDecoration(
                hintText: 'Full Name',
                prefixIcon: Container(
                  padding: EdgeInsets.all(12),
                  child: SvgPicture.asset('assets/icons/Profile.svg', color: Colors.black),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColor.secondary, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColor.primary, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            SizedBox(height: 16),
            // Email
            TextField(
              autofocus: false,
              controller: controller.emailC,
              decoration: InputDecoration(
                hintText: 'youremail@email.com',
                prefixIcon: Container(
                  padding: EdgeInsets.all(12),
                  child: SvgPicture.asset('assets/icons/Message.svg', color: Colors.black),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColor.secondary, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColor.primary, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            SizedBox(height: 16),
            // Password
            Obx(
              () {
                print('${controller.obsecureTextPassword.value}');
                return TextField(
                  autofocus: false,
                  controller: controller.passwordC,
                  obscureText: controller.obsecureTextPassword.value,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    prefixIcon: Container(
                      padding: EdgeInsets.all(12),
                      child: SvgPicture.asset('assets/icons/Lock.svg', color: Colors.black),
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColor.secondary, width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColor.primary, width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    //
                    suffixIcon: IconButton(
                      onPressed: () {
                        controller.changeObsecureTextPassword();
                      },
                      icon: (controller.obsecureTextPassword.value == true)
                          ? SvgPicture.asset('assets/icons/Hide.svg', color: Colors.black)
                          : SvgPicture.asset('assets/icons/Show.svg', color: Colors.black),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 16),

            // Re Password
            Obx(
              () {
                return TextField(
                  autofocus: false,
                  controller: controller.rePasswordC,
                  obscureText: controller.obsecureTextRePassword.value,
                  decoration: InputDecoration(
                    hintText: 'Re Password',
                    prefixIcon: Container(
                      padding: EdgeInsets.all(12),
                      child: SvgPicture.asset('assets/icons/Lock.svg', color: Colors.black),
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColor.secondary, width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColor.primary, width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    //
                    suffixIcon: IconButton(
                      onPressed: () {
                        controller.changeObsecureTextRePassword();
                        print(controller.obsecureTextRePassword);
                      },
                      icon: (controller.obsecureTextRePassword.value == true)
                          ? SvgPicture.asset('assets/icons/Hide.svg', color: Colors.black)
                          : SvgPicture.asset('assets/icons/Show.svg', color: Colors.black),
                    ),
                  ),
                );
              },
            ),

            Obx(
              () => ErrorToast(
                message: '${controller.passwordNotMatchMessage}',
                isVisible: controller.showPasswordError.value,
              ),
            ),
            Obx(
              () => ErrorToast(
                message: '${authC.registerErrorMessage.value}',
                isVisible: authC.isRegisterError.value,
              ),
            ),
            // Forgot Passowrd
            Container(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Forgot Password ?',
                  style: TextStyle(fontSize: 12, color: AppColor.primary.withOpacity(0.5), fontWeight: FontWeight.w500),
                ),
                style: TextButton.styleFrom(
                  primary: AppColor.primary.withOpacity(0.1),
                ),
              ),
            ),
            // Sign In button
            ElevatedButton(
              onPressed: () {
                if (controller.showPasswordError != true) {
                  authC.register(
                    email: controller.emailC.text,
                    password: controller.passwordC.text,
                    fullName: controller.fullNameC.text,
                    username: controller.usernameC.text,
                  );
                }
              },
              child: Text(
                'Masuk',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18, fontFamily: 'poppins'),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 36, vertical: 18),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                primary: AppColor.primary,
                elevation: 0,
                shadowColor: Colors.transparent,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: 48,
        alignment: Alignment.center,
        child: TextButton(
          onPressed: () => Get.toNamed(Routes.REGISTER),
          style: TextButton.styleFrom(
            primary: AppColor.secondary.withOpacity(0.1),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Belum punya akun?',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                ' Daftar',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.7),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

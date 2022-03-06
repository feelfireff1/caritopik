import 'package:caritopik/app/routes/app_pages.dart';
import 'package:caritopik/app/utils/app_color.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/welcome_controller.dart';

class WelcomeView extends GetView<WelcomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
            opacity: 0.15,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 16),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(color: Colors.black, fontSize: 24, fontFamily: 'poppins'),
                  children: [
                    TextSpan(text: 'Selamat Datang\ndi'),
                    TextSpan(
                      text: ' Caritopik 👋',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ),
            Text(
              'Tempat cari topik untuk\nbahan obrolanmu.',
              style: TextStyle(color: Colors.black.withOpacity(0.7)),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 32),
        height: 168,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(bottom: 16),
              child: ElevatedButton(
                onPressed: () => Get.toNamed(Routes.LOGIN),
                child: Text(
                  'Masuk',
                  style: TextStyle(fontSize: 18, fontFamily: 'poppins', fontWeight: FontWeight.w500),
                ),
                style: ElevatedButton.styleFrom(
                  primary: AppColor.primary,
                  shadowColor: Colors.white,
                  elevation: 0,
                  padding: EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(bottom: 24),
              child: ElevatedButton(
                onPressed: () => Get.toNamed(Routes.REGISTER),
                child: Text(
                  'Daftar',
                  style: TextStyle(fontSize: 18, fontFamily: 'poppins', fontWeight: FontWeight.w500, color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                  primary: AppColor.secondary,
                  shadowColor: Colors.white,
                  elevation: 0,
                  padding: EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

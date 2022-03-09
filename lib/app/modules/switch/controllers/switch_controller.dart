import 'package:caritopik/app/modules/bookmarks/controllers/bookmarks_controller.dart';
import 'package:caritopik/app/modules/bookmarks/views/bookmarks_view.dart';
import 'package:caritopik/app/modules/home/controllers/home_controller.dart';
import 'package:caritopik/app/modules/home/views/home_view.dart';
import 'package:caritopik/app/modules/profile/controllers/profile_controller.dart';
import 'package:caritopik/app/modules/profile/views/profile_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SwitchController extends GetxController {
  var selectedIndex = 2.obs;

  Widget returnHomeView() {
    Get.lazyPut(() => HomeController());
    return HomeView();
  }

  Widget returnBookmarksView() {
    Get.lazyPut(() => BookmarksController());
    return BookmarksView();
  }

  Widget returnProfileView() {
    Get.lazyPut(() => ProfileController());
    return ProfileView();
  }

  changeView(int index) {
    selectedIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}

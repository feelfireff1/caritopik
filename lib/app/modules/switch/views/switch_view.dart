import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../controllers/switch_controller.dart';

class SwitchView extends GetView<SwitchController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: [
          controller.returnHomeView(),
          controller.returnBookmarksView(),
          controller.returnProfileView(),
        ][controller.selectedIndex.value],
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: 75,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            border: Border(top: BorderSide(color: Colors.blue, width: 1)),
            color: Colors.black,
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            backgroundColor: Colors.black,
            currentIndex: controller.selectedIndex.value,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            onTap: controller.changeView,
            items: <BottomNavigationBarItem>[
              (controller.selectedIndex == 0)
                  ? BottomNavigationBarItem(icon: SvgPicture.asset('assets/icons/Home-active.svg', color: Colors.white), label: 'Home', backgroundColor: Colors.black)
                  : BottomNavigationBarItem(icon: SvgPicture.asset('assets/icons/Home.svg', color: Colors.white), label: 'Home', backgroundColor: Colors.black),
              (controller.selectedIndex == 1)
                  ? BottomNavigationBarItem(icon: SvgPicture.asset('assets/icons/Bookmark-active.svg', color: Colors.white), label: 'Home', backgroundColor: Colors.black)
                  : BottomNavigationBarItem(icon: SvgPicture.asset('assets/icons/Bookmark.svg', color: Colors.white), label: 'Home', backgroundColor: Colors.black),
              (controller.selectedIndex == 2)
                  ? BottomNavigationBarItem(icon: SvgPicture.asset('assets/icons/Profile-active.svg', color: Colors.white), label: 'Home', backgroundColor: Colors.black)
                  : BottomNavigationBarItem(icon: SvgPicture.asset('assets/icons/Profile.svg', color: Colors.white), label: 'Home', backgroundColor: Colors.black),
            ],
          ),
        ),
      );
    });
  }
}

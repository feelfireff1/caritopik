import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddProductController extends GetxController {
  late TextEditingController nameC;
  late TextEditingController priceC;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void addProduct({String? name, int? price}) async {
    String dateTime = DateTime.now().toIso8601String();
    CollectionReference products = firestore.collection("products");
    await products.add({
      "name": name,
      "price": price,
      'time': dateTime,
    }).then((value) {
      Get.defaultDialog(
        title: 'Produk berhasil ditambahkan',
        middleText: value.toString(),
        onConfirm: () {
          nameC.clear();
          priceC.clear();
          Get.back();
          Get.back();
        },
        textConfirm: 'oke',
      );
    }).catchError((error) {
      Get.defaultDialog(
        title: 'Produk gagal ditambahkan',
        onConfirm: () => Get.back(),
        textConfirm: 'oke',
        middleText: error.toString(),
      );
    });
  }

  @override
  void onInit() {
    super.onInit();
    nameC = TextEditingController();
    priceC = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    nameC.dispose();
    priceC.dispose();
  }
}

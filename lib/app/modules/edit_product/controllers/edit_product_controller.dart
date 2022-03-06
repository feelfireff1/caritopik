import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProductController extends GetxController {
  late TextEditingController nameC;
  late TextEditingController priceC;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<DocumentSnapshot<Object?>> getData(String docId) async {
    DocumentReference doc = await firestore.collection("products").doc(docId);
    return doc.get();
  }

  updateProduct({String? name, int? price, @required String? docId}) async {
    DocumentReference doc = await firestore.collection("products").doc(docId);

    await doc.update({
      'name': name,
      'price': price,
    }).then((value) {
      value;
      Get.defaultDialog(
        title: 'Produk berhasil diupdate',
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
        title: 'Produk gagal diupdate',
        onConfirm: () => Get.back(),
        textConfirm: 'oke',
        middleText: error.toString(),
      );
    });
  }

  final count = 0.obs;
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

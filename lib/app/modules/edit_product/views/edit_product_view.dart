import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/edit_product_controller.dart';

class EditProductView extends GetView<EditProductController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EditProductView'),
        centerTitle: true,
      ),
      body: FutureBuilder<DocumentSnapshot<Object?>>(
        future: controller.getData(Get.arguments),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var data = snapshot.data!.data() as Map<String, dynamic>;
            controller.nameC.text = data['name'];
            controller.priceC.text = data['price'].toString();
            return ListView(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              children: [
                TextField(
                  decoration: InputDecoration(labelText: "Nama Produk"),
                  controller: controller.nameC,
                ),
                TextField(
                  decoration: InputDecoration(labelText: "Harga Produk"),
                  controller: controller.priceC,
                ),
                Container(
                  height: 40,
                  margin: EdgeInsets.only(top: 24, bottom: 36),
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    child: const Text('Update Produk'),
                    onPressed: () {
                      controller.updateProduct(
                        docId: Get.arguments,
                        name: controller.nameC.text,
                        price: int.parse(controller.priceC.text),
                      );
                    },
                  ),
                ),
              ],
            );
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}

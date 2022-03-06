import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_product_controller.dart';

class AddProductView extends GetView<AddProductController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product'),
        centerTitle: true,
      ),
      body: ListView(
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
              child: const Text('Tambah Produk'),
              onPressed: () => controller.addProduct(name: controller.nameC.text, price: int.parse(controller.priceC.text)),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:caritopik/app/controllers/auth_controller.dart';
import 'package:caritopik/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => authC.logout(),
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.ADD_PRODUCT),
        child: Icon(Icons.add),
      ),
      body: FutureBuilder(
        future: controller.futureData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return RefreshIndicator(
              onRefresh: controller.refreshData,
              child: Obx(() {
                var listProduct = controller.data.value;
                return ListView.builder(
                  itemCount: controller.data.value.length,
                  physics: AlwaysScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    var product = listProduct[index].data() as Map<String, dynamic>;
                    return ListTile(
                      title: Text('${product["name"]}'),
                      subtitle: Text('${product["price"]}'),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          controller.deleteData(listProduct[index].id);
                        },
                      ),
                      onTap: () => Get.toNamed(Routes.EDIT_PRODUCT, arguments: listProduct[index].id),
                    );
                  },
                );
              }),
            );
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}

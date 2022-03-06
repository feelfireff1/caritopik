import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  late Future futureData;
  Rx<List<QueryDocumentSnapshot<Object?>>> data = Rx<List<QueryDocumentSnapshot<Object?>>>([]);

  Future<List<QueryDocumentSnapshot<Object?>>> getData() async {
    CollectionReference products = await FirebaseFirestore.instance.collection("products");
    final get = await products.orderBy('time', descending: true).get();
    return get.docs;
  }

  Future<void> initData() async {
    final datas = await getData();
    data.value = datas;
  }

  Future<void> refreshData() async {
    final datas = await getData();
    data.value = datas;
  }

  deleteData(String docId) async {
    DocumentReference doc = FirebaseFirestore.instance.collection('products').doc(docId);
    await doc.delete().then((value) {
      value;
      Get.defaultDialog(
        title: 'Produk berhasil dihapus',
      );
    }).catchError((error) {
      Get.defaultDialog(
        title: 'Produk gagal dihapus',
      );
    });
    ;
    refreshData();
  }

  @override
  void onInit() {
    super.onInit();
    futureData = initData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}

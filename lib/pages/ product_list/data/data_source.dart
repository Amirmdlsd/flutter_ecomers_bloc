import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled2/pages/home_page/data/model/product_model.dart';
import 'package:untitled2/widget/flutter_toast_widget.dart';

abstract class IProductListDataSource {
  Future<List<ProductModel>> getProductByCatId(String categoryId);
}

class ProductListDataSource extends IProductListDataSource {
  @override
  Future<List<ProductModel>> getProductByCatId(String categoryId) async {
    try {
      CollectionReference product =
      FirebaseFirestore.instance.collection('product');
      QuerySnapshot querySnapshot = await product.get();
      return querySnapshot.docs
          .where((element) => element['catId'] == categoryId)
          .map((e) => ProductModel(
          id: e.id,
          catId: e['catId'],
          title: e['title'],
          image: e['image'],
          price: e['price'],
          discount: e['discount'],
          count: e['count'],
          isHot: e['isHot'],
          mostSell: e['mostSell']))
          .toList();
    } catch (e) {
      ShowToast.ShowMessage('خطایی رخ داده است');
      throw Exception(e.toString());
    }
  }
}

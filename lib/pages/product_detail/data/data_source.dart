import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import '../../home_page/data/model/product_model.dart';

abstract class IProductDetailDataSource {
  Future<ProductModel> getDetail(String productId);
}

class ProductDetailDataSource extends IProductDetailDataSource {
  @override
  Future<ProductModel> getDetail(String productId) async {
    try {
      DocumentReference detail =
          FirebaseFirestore.instance.collection('product').doc(productId);
      DocumentSnapshot e = await detail.get();

      if (e.exists) {
        return ProductModel(
            id: e.id,
            pId: e['pId'],
            catId: e['catId'],
            title: e['title'],
            image: e['image'],
            price: e['price'],
            discount: e['discount'],
            count: e['count'],
            isHot: e['isHot'],
            mostSell: e['mostSell']);
      } else {
        throw Exception('کالا یافت نشد');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

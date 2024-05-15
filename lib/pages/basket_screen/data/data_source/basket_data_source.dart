import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled2/pages/basket_screen/data/model/basket_item_model.dart';
import 'package:untitled2/pages/home_page/data/model/product_model.dart';
import 'package:untitled2/utils/auth_manager.dart';
import 'package:untitled2/utils/constant.dart';
import 'package:untitled2/widget/flutter_toast_widget.dart';

abstract class IBasketDataSource {
  Future<void> addToBasket(ProductModel productModel);

  Future<List<BasketItemModel>> getBasketList();

  Future<void> decreaseItemCount(num pId);

  Future<void> deleteFromBasket(num pId);
}

class BasketRemoteDataSource extends IBasketDataSource {
  @override
  Future<void> addToBasket(ProductModel productModel) async {
    try {
      var response = FirebaseFirestore.instance.collection('basket');

      // Check if the product already exists in the basket
      var existingProduct = await response
          .where('pId', isEqualTo: productModel.pId)
          .where('userId', isEqualTo: AuthManager.getUId())
          .get();

      if (existingProduct.docs.isNotEmpty) {
        for (var i in existingProduct.docs) {
          await response.doc(i.id).update({
            'number': FieldValue.increment(1),
          });
        }

        ShowToast.ShowMessage('تعداد محصول در سبد خرید افزایش یافت');
      } else {
        await response.add({
          'catId': productModel.catId,
          'count': productModel.count,
          'discount': productModel.discount,
          'image': productModel.image,
          'isHot': productModel.isHot,
          'mostSell': productModel.mostSell,
          'number': 1,
          'pId': productModel.pId,
          'price': productModel.price,
          'title': productModel.title,
          'userId': AuthManager.getUId(),
          'finalPrice': productModel.finalPrice
        });
      }
    } catch (e) {
      ShowToast.ShowMessage(e.toString());
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<BasketItemModel>> getBasketList() async {
    try {
      var response = FirebaseFirestore.instance.collection('basket');
      QuerySnapshot querySnapshot = await response.get();
      var list = querySnapshot.docs
          .where((element) => element['userId'] == AuthManager.getUId())
          .map<BasketItemModel>((map) {
        return BasketItemModel(
          finalPrice: map['finalPrice'],
          catId: map['catId'],
          count: map['count'],
          discount: map['discount'],
          image: map['image'],
          isHot: map['isHot'],
          mostSell: map['mostSell'],
          number: map['number'],
          pId: map['pId'],
          price: map['price'],
          title: map['title'],
        );
      }).toList();
      debugPrint('Adasdadadas =${list.length}');
      return list;
    } catch (e) {
      ShowToast.ShowMessage(e.toString());

      throw Exception(e.toString());
    }
  }

  @override
  Future<void> decreaseItemCount(num pId) async {
    try {
      var response = FirebaseFirestore.instance.collection('basket');

      var existingProduct = await response
          .where('pId', isEqualTo: pId)
          .where('userId', isEqualTo: AuthManager.getUId())
          .get();

      if (existingProduct.docs.isNotEmpty) {
        for (var e in existingProduct.docs) {
          response.doc(e.id).update({'number': e['number'] - 1});
        }
      }
    } catch (e) {
      ShowToast.ShowMessage(e.toString());
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> deleteFromBasket(num pId) async {
    try {
      var response = FirebaseFirestore.instance.collection('basket');

      var snapshot = await response
          .where('pId', isEqualTo: pId)
          .where('userId', isEqualTo: AuthManager.getUId())
          .get();

      if (snapshot.docs.isNotEmpty) {

        for (var doc in snapshot.docs) {
          await doc.reference.delete();
        }
      }
    } catch (e) {
      ShowToast.ShowMessage('خطایی رخ داده است');
      throw Exception(e.toString());
    }
  }
}

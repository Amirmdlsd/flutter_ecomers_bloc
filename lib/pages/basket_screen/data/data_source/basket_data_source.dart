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
}

class BasketRemoteDataSource extends IBasketDataSource {
  @override
  Future<void> addToBasket(ProductModel productModel) async {
    try {
      var response = FirebaseFirestore.instance.collection('basket');

      // Check if the product already exists in the basket
      var existingProduct = await response
          .where('pId', isEqualTo: productModel.pId) // Changed 'id' to 'pId'
          .where('userId', isEqualTo: AuthManager.getUId())
          .get();

      if (existingProduct.docs.isNotEmpty) {
        // If the product exists, update the 'number' field
        for(var i in  existingProduct.docs){
          await response.doc(i.id).update({
            'number': FieldValue.increment(1),
          });
        }

        ShowToast.ShowMessage('تعداد محصول در سبد خرید افزایش یافت');
      } else {
        // If the product does not exist, add it to the basket
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
          'finalPrice':productModel.finalPrice
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
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled2/pages/home_page/data/model/category_model.dart';
import 'package:untitled2/pages/home_page/data/model/product_model.dart';
import 'package:untitled2/pages/home_page/data/model/slider_model.dart';

abstract class IHomeDataSource {
  Future<List<SliderModel>> getSlider();

  Future<List<CategoryModel>> getCategory();

  Future<List<ProductModel>> getAmazingProduct();

  Future<List<ProductModel>> getMostSellProduct();
}

class HomeDataSource extends IHomeDataSource {
  @override
  Future<List<SliderModel>> getSlider() async {
    try {
      CollectionReference slider =
          FirebaseFirestore.instance.collection('slider');
      QuerySnapshot querySnapshot = await slider.get();
      return querySnapshot.docs.map((e) {
        return SliderModel(id: e.id, imageUrl: e['image']);
      }).toList();
    } catch (e) {
      debugPrint("----------------------$e");
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<CategoryModel>> getCategory() async {
    try {
      CollectionReference category =
          FirebaseFirestore.instance.collection('category');
      QuerySnapshot snapshot = await category.get();
      return snapshot.docs.map((e) {
        return CategoryModel(id: e.id, title: e['title'], image: e['image']);
      }).toList();
    } catch (e) {
      debugPrint("----------------------$e");
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<ProductModel>> getAmazingProduct() async {
    try {
      CollectionReference amazing =
          FirebaseFirestore.instance.collection('product');
      QuerySnapshot querySnapshot = await amazing.get();
      return querySnapshot.docs.where((p) => p['isHot'] == true).map((e) {
        return ProductModel(
            id: e.id,
            catId: e['catId'],
            title: e['title'],
            image: e['image'],
            price: e['price'],
            discount: e['discount'],
            count: e['count'],
            isHot: e['isHot'],
            mostSell: e['mostSell']);
      }).toList();
    } catch (e) {
      debugPrint("----------------------$e");
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<ProductModel>> getMostSellProduct() async {
    try {
      CollectionReference mostSell =
          FirebaseFirestore.instance.collection('product');
      QuerySnapshot querySnapshot = await mostSell.get();
      var list = querySnapshot.docs
          .where((element) => element['mostSell'] == true)
          .map((e) {
        return ProductModel(
            id: e.id,
            catId: e['catId'],
            title: e['title'],
            image: e['image'],
            price: e['price'],
            discount: e['discount'],
            count: e['count'],
            isHot: e['isHot'],
            mostSell: e['mostSell']);
      }).toList();

      debugPrint('too llist is ${list.length}');
      return list;
    } catch (e) {
      debugPrint("----------------------$e");
      throw Exception(e.toString());
    }
  }
}

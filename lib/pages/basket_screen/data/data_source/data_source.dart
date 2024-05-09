import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:untitled2/pages/basket_screen/data/model/basket_model.dart';

abstract class INextBasketLocalDataSource {
  Future<List<BasketModel>> getAllbasketList();

  Future<void> addTobasketList(BasketModel basketModel);

  Future<void> removeBasketList(int basketId);
}

class NextBasketLocalDataSource extends INextBasketLocalDataSource {
  var box = Hive.box<BasketModel>('basket');

  @override
  Future<List<BasketModel>> getAllbasketList() async {
    try {
      debugPrint('list sabad kharid is =========${box.values.toList().length}');
      return box.values.toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> addTobasketList(BasketModel basketModel) async {
    try {
      box.add(basketModel);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> removeBasketList(int basketId) async {
    try {
      box.deleteAt(basketId);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

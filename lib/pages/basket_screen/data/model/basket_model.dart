import 'package:hive/hive.dart';

part 'basket_model.g.dart';

@HiveType(typeId: 0)
class BasketModel extends HiveObject {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? catId;
  @HiveField(2)
  String? title;
  @HiveField(3)
  String? image;
  @HiveField(4)
  num? price;
  @HiveField(5)
  num? discount;
  @HiveField(6)
  bool? isHot;
  @HiveField(7)
  bool? mostSell;
  @HiveField(8)
  double? finalPrice;
  @HiveField(9)
  int? count;
  @HiveField(10)
  int? pId;

  BasketModel(
      {this.id,
      this.pId,
      this.catId,
      this.title,
      this.image,
      this.price,
      this.discount,
      this.mostSell,
      this.isHot,
      this.count,
      this.finalPrice});
}

class ProductModel {
  String? id;
  int? pId;
  String? catId;
  String? title;
  String? image;
  num? price;
  num? discount;
  bool? isHot;
  bool? mostSell;
  double? finalPrice;
  int? count;
  final bool isIncreasing;
  final bool isDincreasing;

  ProductModel(
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
      this.isDincreasing=false,
      this.isIncreasing=false,
      }) {
    finalPrice = price! - ((price! * discount!) / 100);
  }
}

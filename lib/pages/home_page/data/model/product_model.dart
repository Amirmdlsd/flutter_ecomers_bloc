class ProductModel {
  String ?id;
  String ?catId;
  String ?title;
  String ?image;
  num ?price;
  num ?discount;
  bool ?isHot;
  bool ?mostSell;
  double? finalPrice;
  int ?count;

  ProductModel(
  { this.id, this.catId, this.title, this.image, this.price, this.discount,this.mostSell,this.isHot,this.count}) {
    finalPrice = price! - ((price! * discount!) / 100);
  }
}

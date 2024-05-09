class BasketItemModel {
  final String catId;
  final num count;
  final num discount;
  final String image;
  final bool isHot;
  final bool mostSell;
  final num number;
  final num pId;
  final num price;
  final String title;
  final num finalPrice;

  BasketItemModel({
    required this.finalPrice,
    required this.catId,
    required this.count,
    required this.discount,
    required this.image,
    required this.isHot,
    required this.mostSell,
    required this.number,
    required this.pId,
    required this.price,
    required this.title,
  });


}

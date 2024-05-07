abstract class ProductDetailEvent{}


class ProductDetailResponseEvent extends ProductDetailEvent{
  String id;

  ProductDetailResponseEvent(this.id);
}
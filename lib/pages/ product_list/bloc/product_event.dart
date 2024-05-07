abstract class ProductListEvent{}

class FetchProductListEvent extends ProductListEvent{
  String categoryId;

  FetchProductListEvent(this.categoryId);
}
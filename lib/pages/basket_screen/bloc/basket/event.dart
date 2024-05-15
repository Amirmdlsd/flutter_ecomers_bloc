import 'package:untitled2/pages/home_page/data/model/product_model.dart';

abstract class BasketEvent {}

class AddToBasketEvent extends BasketEvent {
  final ProductModel productModel;
  final int value;

  AddToBasketEvent(this.productModel, this.value);
}

class GetAllBasketDataEvent extends BasketEvent {}

class IncreaseCounterEvent extends BasketEvent {
  final ProductModel productModel;

  IncreaseCounterEvent(this.productModel);

}


class DecreaseCounterEvent extends BasketEvent{
  num pId;

  DecreaseCounterEvent(this.pId);
}
class DeleteItemEvent extends BasketEvent{
  num pId;

  DeleteItemEvent(this.pId);
}



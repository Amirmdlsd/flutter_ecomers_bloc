import 'package:dartz/dartz.dart';
import 'package:untitled2/pages/basket_screen/data/model/basket_item_model.dart';

abstract class BasketState{}

class BasketInitState extends BasketState{}


class BasketLoadingState extends BasketState{}


class AddToBasketState extends BasketState{
  Either<String ,String>result;

  AddToBasketState(this.result);
}
class GetAllBasketItemState extends BasketState{
  Either<String ,List<BasketItemModel>>basket;

  GetAllBasketItemState(this.basket);
}
import 'package:dartz/dartz.dart';

import '../data/model/basket_model.dart';

abstract class NextBasketState{}


class NextBasketInitState extends NextBasketState{}
class NextBasketLoadinState extends NextBasketState{}



class AddToNextBasketResponseState extends NextBasketState{
  Either<String,String>addToBasket;

  AddToNextBasketResponseState(this.addToBasket);
}

class NextBasketGetAllItem extends NextBasketState{
  Either<String,List<BasketModel>>basket;

  NextBasketGetAllItem(this.basket);
}




import 'package:untitled2/pages/basket_screen/bloc/basket/state.dart';
import 'package:untitled2/pages/basket_screen/data/model/basket_model.dart';

abstract class NextBasketEvent{}
 class GetAllNextBasketEvent extends  NextBasketEvent{}

class AddToNextBasketEvent extends NextBasketEvent{
  BasketModel basketModel;

  AddToNextBasketEvent(this.basketModel);
}

class RemoveFromNextBasketEvent extends NextBasketEvent{
  int index;

  RemoveFromNextBasketEvent(this.index);
}

class BasketGetDataState extends BasketState{

}


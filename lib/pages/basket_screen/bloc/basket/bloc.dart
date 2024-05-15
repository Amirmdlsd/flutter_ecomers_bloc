import 'package:bloc/bloc.dart';
import 'package:untitled2/pages/basket_screen/bloc/basket/event.dart';
import 'package:untitled2/pages/basket_screen/bloc/basket/state.dart';

import '../../data/repo/basket_repo.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  final BasketRepo _repo;

  BasketBloc(this._repo) : super(BasketInitState()) {
    on<AddToBasketEvent>((event, emit) async {
      emit(BasketLoadingState());
      await _repo
          .addToBasket(event.productModel)
          .then((value) => emit(AddToBasketState(value)));
    });

    on<GetAllBasketDataEvent>((event, emit) async {
      emit(BasketLoadingState());
      var basket = await _repo.getBasketItem();
      emit(GetAllBasketItemState(basket));
    });

    on<IncreaseCounterEvent>((event, emit) async {

      await _repo.addToBasket(event.productModel);
      var basket = await _repo.getBasketItem();
      emit(GetAllBasketItemState(basket));
    });

    on<DecreaseCounterEvent>((event, emit)async {
      await _repo.removeCounter(event.pId);
      var basket = await _repo.getBasketItem();
      emit(GetAllBasketItemState(basket));
    });
    on<DeleteItemEvent>((event, emit) async {
      await _repo.deleteItemFromBasket(event.pId);
      var all = await _repo.getBasketItem();
      emit(GetAllBasketItemState(all));
    });
  }
}

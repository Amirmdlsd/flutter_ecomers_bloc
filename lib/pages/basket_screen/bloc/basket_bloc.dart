import 'package:bloc/bloc.dart';
import 'package:untitled2/pages/basket_screen/basket_screen.dart';
import 'package:untitled2/pages/basket_screen/bloc/basket_event.dart';
import 'package:untitled2/pages/basket_screen/bloc/basket_state.dart';

import '../data/repo/repository.dart';

class NextBasketBloc extends Bloc<NextBasketEvent, NextBasketState> {
  final INextBasketRepo _repo;


  NextBasketBloc(this._repo) : super(NextBasketInitState()) {
    on<AddToNextBasketEvent>(_addToBasket);
    on<GetAllNextBasketEvent>((event, emit)async{
      emit(NextBasketLoadinState());
      var all = await _repo.getAllBasket();
      emit(NextBasketGetAllItem(all));
    });
    on<RemoveFromNextBasketEvent>((event, emit) async {
      await _repo.removeItem(event.index);
      var all = await _repo.getAllBasket();
      emit(NextBasketGetAllItem(all));
    });
  }

  Future<void> _addToBasket(
      AddToNextBasketEvent event, Emitter<NextBasketState> emit) async {
    emit(NextBasketLoadinState());
    var add = await _repo.addToBasket(event.basketModel);
    emit(AddToNextBasketResponseState(add));
  }
}

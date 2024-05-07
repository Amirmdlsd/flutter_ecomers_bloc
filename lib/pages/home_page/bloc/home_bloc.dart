import 'package:bloc/bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:untitled2/pages/home_page/bloc/home_event.dart';
import 'package:untitled2/pages/home_page/bloc/home_state.dart';

import '../../../locator.dart';
import '../data/repository.dart';

class HomeBLoc extends Bloc<HomeEvent, HomeState> {
  final IHomeRepository _repository = locator.get();

  HomeBLoc() : super(HomeInitState()) {
    on<HomeFetchDataEvent>((event, emit) async {
      EasyLoading.show();
      var slider = await _repository.getSlider();
      var cat = await _repository.getCategory();
      var amazingProduct = await _repository.getAmazingProduct();
      var mostSellProduct = await _repository.getMostSellProduct();
      EasyLoading.dismiss();
      emit(HomeResponseState(slider,cat,amazingProduct,mostSellProduct));
    });
  }
}

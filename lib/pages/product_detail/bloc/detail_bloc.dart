import 'package:bloc/bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:untitled2/pages/product_detail/bloc/detail_event.dart';
import 'package:untitled2/pages/product_detail/bloc/detail_state.dart';
import 'package:untitled2/pages/product_detail/data/repository.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  final IProductDetailRepositry _repo;

  ProductDetailBloc(this._repo) : super(ProductDetailInitState()) {
    on<ProductDetailResponseEvent>((event, emit) async {
      emit(ProductDetailLoadingState());
      await _repo.getDetail(event.id).then((value) =>
          emit(ProductDetailResponseState(value))
      );
    });
  }
}

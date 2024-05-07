import 'package:bloc/bloc.dart';
import 'package:untitled2/pages/%20product_list/bloc/product_event.dart';
import 'package:untitled2/pages/%20product_list/bloc/product_state.dart';
import 'package:untitled2/pages/%20product_list/data/repository.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  final IProductListRepository _repository;

  ProductListBloc(this._repository) : super(ProductListInitState()) {
    on<FetchProductListEvent>((event, emit) async {
      emit(ProductListLoadingState());
      var product = await _repository.getProductListByCatId(event.categoryId);
      emit(ProductListResponseState(product));
    });
  }
}

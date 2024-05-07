import 'package:dartz/dartz.dart';
import 'package:untitled2/pages/home_page/data/model/product_model.dart';

abstract class ProductListState{}

class ProductListInitState extends ProductListState{}
class ProductListLoadingState extends ProductListState{}
class ProductListResponseState extends ProductListState{
  final Either<String,List<ProductModel>>product;

  ProductListResponseState(this.product);
}
import 'package:dartz/dartz.dart';
import 'package:untitled2/pages/home_page/data/model/product_model.dart';

abstract class ProductDetailState{}

class ProductDetailInitState extends ProductDetailState{}
class ProductDetailLoadingState extends ProductDetailState{}
class ProductDetailResponseState extends ProductDetailState{
  Either<String,ProductModel>detail;

  ProductDetailResponseState(this.detail);
}
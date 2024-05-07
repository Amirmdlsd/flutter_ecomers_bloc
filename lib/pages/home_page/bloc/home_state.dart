import 'package:dartz/dartz.dart';
import 'package:untitled2/pages/home_page/data/model/category_model.dart';
import 'package:untitled2/pages/home_page/data/model/product_model.dart';
import 'package:untitled2/pages/home_page/data/model/slider_model.dart';

abstract class HomeState {}

class HomeInitState extends HomeState {}

class HomeResponseState extends HomeState {
  Either<String, List<SliderModel>> slider;
  Either<String, List<CategoryModel>> category;
  Either<String, List<ProductModel>> amazingProduct;
  Either<String, List<ProductModel>> mostSellProduct;

  HomeResponseState(this.slider,this.category,this.amazingProduct,this.mostSellProduct);
}

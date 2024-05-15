import 'package:dartz/dartz.dart';
import 'package:untitled2/locator.dart';
import 'package:untitled2/pages/home_page/data/data_source.dart';
import 'package:untitled2/pages/home_page/data/model/category_model.dart';
import 'package:untitled2/pages/home_page/data/model/product_model.dart';
import 'package:untitled2/pages/home_page/data/model/slider_model.dart';

abstract class IHomeRepository {
  Future<Either<String, List<SliderModel>>> getSlider();

  Future<Either<String, List<CategoryModel>>> getCategory();

  Future<Either<String, List<ProductModel>>> getAmazingProduct();

  Future<Either<String, List<ProductModel>>> getMostSellProduct();

  Future<Either<String, List<ProductModel>>> searchProducts(String query);
}

class HomeRepository extends IHomeRepository {
  final IHomeDataSource _dataSource = locator.get();

  @override
  Future<Either<String, List<SliderModel>>> getSlider() async {
    try {
      var response = await _dataSource.getSlider();
      return right(response);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, List<CategoryModel>>> getCategory() async {
    try {
      var response = await _dataSource.getCategory();
      return right(response);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, List<ProductModel>>> getAmazingProduct() async {
    try {
      var response = await _dataSource.getAmazingProduct();
      return right(response);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, List<ProductModel>>> getMostSellProduct() async {
    try {
      var response = await _dataSource.getMostSellProduct();
      return right(response);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, List<ProductModel>>> searchProducts(
      String query) async {
    try {
      var response = await _dataSource.getMostSellProduct();
      return right(response);
    } catch (e) {
      return left(e.toString());
    }
  }
}

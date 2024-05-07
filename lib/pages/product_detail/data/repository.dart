import 'package:dartz/dartz.dart';
import 'package:untitled2/locator.dart';
import 'package:untitled2/pages/product_detail/data/data_source.dart';

import '../../home_page/data/model/product_model.dart';

abstract class IProductDetailRepositry {
  Future<Either<String, ProductModel>> getDetail(String id);
}

class ProductDetailRepository extends IProductDetailRepositry {
  final IProductDetailDataSource _dataSource = locator.get();

  @override
  Future<Either<String, ProductModel>> getDetail(String id) async {
    try {
      var response = await _dataSource.getDetail(id);
      return right(response);
    } catch (e) {
      return left(e.toString());
    }
  }
}

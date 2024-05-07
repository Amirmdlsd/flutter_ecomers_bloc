import 'package:dartz/dartz.dart';
import 'package:untitled2/pages/%20product_list/data/data_source.dart';
import 'package:untitled2/pages/home_page/data/model/product_model.dart';
import 'package:untitled2/pages/product_detail/data/data_source.dart';

abstract class IProductListRepository {
  Future<Either<String, List<ProductModel>>> getProductListByCatId(
      String catId);
}

class ProductListRepository extends IProductListRepository {
  final IProductListDataSource _dataSource;

  ProductListRepository(this._dataSource);

  @override
  Future<Either<String, List<ProductModel>>> getProductListByCatId(
      String catId) async {
    try {
      var response = await _dataSource.getProductByCatId(catId);
      return right(response);
    } catch (e) {
      return left(e.toString());
    }
  }
}

import 'package:dartz/dartz.dart';
import 'package:untitled2/pages/basket_screen/data/data_source/basket_data_source.dart';
import 'package:untitled2/pages/basket_screen/data/model/basket_item_model.dart';
import 'package:untitled2/pages/home_page/data/model/product_model.dart';

abstract class BasketRepo {
  Future<Either<String, String>> addToBasket(
      ProductModel productModel);

  Future<Either<String, List<BasketItemModel>>> getBasketItem();
}

class BasketRemoteRepo extends BasketRepo {
  final IBasketDataSource _dataSource;

  BasketRemoteRepo(this._dataSource);

  @override
  Future<Either<String, String>> addToBasket(
      ProductModel productModel) async {
    try {
      var response = await _dataSource.addToBasket(productModel);
      return right("به سبد خرید اضافه شد");
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, List<BasketItemModel>>> getBasketItem() async {
    try {
      var response = await _dataSource.getBasketList();
      return right(response);
    } catch (e) {
      return left(e.toString());
    }
  }
}

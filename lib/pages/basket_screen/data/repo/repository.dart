import 'package:dartz/dartz.dart';
import 'package:untitled2/pages/basket_screen/data/data_source/data_source.dart';
import 'package:untitled2/pages/basket_screen/data/model/basket_model.dart';

abstract class INextBasketRepo {
  Future<Either<String, String>> addToBasket(BasketModel basketModel);

  Future<Either<String, List<BasketModel>>> getAllBasket();

  Future<Either<String, String>> removeItem(int index);
}

class NextBasketRepository extends INextBasketRepo {
  final INextBasketLocalDataSource _dataSource;

  NextBasketRepository(this._dataSource);

  @override
  Future<Either<String, String>> addToBasket(BasketModel basketModel) async {
    try {
      var response = await _dataSource.addTobasketList(basketModel);
      return right('به سبد خرید اضافه شد');
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, List<BasketModel>>> getAllBasket() async {
    try {
      var response = await _dataSource.getAllbasketList();
      return right(response);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, String>> removeItem(int index) async {
    try {
      var response =await _dataSource.removeBasketList(index);
      return right('');
    } catch (e) {
      return left(e.toString());
    }
  }
}

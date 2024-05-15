import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled2/pages/%20product_list/data/data_source.dart';
import 'package:untitled2/pages/%20product_list/data/repository.dart';
import 'package:untitled2/pages/basket_screen/data/data_source/basket_data_source.dart';
import 'package:untitled2/pages/basket_screen/data/data_source/data_source.dart';
import 'package:untitled2/pages/basket_screen/data/repo/basket_repo.dart';
import 'package:untitled2/pages/basket_screen/data/repo/repository.dart';
import 'package:untitled2/pages/home_page/data/data_source.dart';
import 'package:untitled2/pages/home_page/data/repository.dart';
import 'package:untitled2/pages/product_detail/data/data_source.dart';
import 'package:untitled2/pages/product_detail/data/repository.dart';
import 'package:untitled2/utils/image_handler.dart';

var locator = GetIt.instance;

Future<void> serviveLocator() async {
  locator.registerSingleton<SharedPreferences>(
      await SharedPreferences.getInstance());

  // data source
  locator.registerSingleton<IHomeDataSource>(HomeDataSource());
  locator.registerSingleton<IProductDetailDataSource>(ProductDetailDataSource());
  locator.registerSingleton<IProductListDataSource>(ProductListDataSource());
  locator.registerSingleton<INextBasketLocalDataSource>(NextBasketLocalDataSource());
  locator.registerSingleton<IBasketDataSource>(BasketRemoteDataSource());

  // repo
  locator.registerSingleton<IHomeRepository>(HomeRepository());
  locator.registerSingleton<IProductDetailRepositry>(ProductDetailRepository());
  locator.registerSingleton<IProductListRepository>(ProductListRepository(locator()));
  locator.registerSingleton<INextBasketRepo>(NextBasketRepository(locator()));
  locator.registerSingleton<BasketRepo>(BasketRemoteRepo(locator()));


//     image picker
locator.registerFactory<ImageHandler>(() =>ImageHandler());
}

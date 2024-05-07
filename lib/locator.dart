import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled2/pages/%20product_list/data/data_source.dart';
import 'package:untitled2/pages/%20product_list/data/repository.dart';
import 'package:untitled2/pages/home_page/data/data_source.dart';
import 'package:untitled2/pages/home_page/data/repository.dart';
import 'package:untitled2/pages/product_detail/data/data_source.dart';
import 'package:untitled2/pages/product_detail/data/repository.dart';

var locator = GetIt.instance;

Future<void> serviveLocator() async {
  locator.registerSingleton<SharedPreferences>(
      await SharedPreferences.getInstance());

  // data source
  locator.registerSingleton<IHomeDataSource>(HomeDataSource());
  locator.registerSingleton<IProductDetailDataSource>(ProductDetailDataSource());
  locator.registerSingleton<IProductListDataSource>(ProductListDataSource());

  // repo
  locator.registerSingleton<IHomeRepository>(HomeRepository());
  locator.registerSingleton<IProductDetailRepositry>(ProductDetailRepository());
  locator.registerSingleton<IProductListRepository>(ProductListRepository(locator()));
}

import 'package:flutter/cupertino.dart';
import 'package:untitled2/pages/%20product_list/product_list_screen.dart';
import 'package:untitled2/pages/edit_page/edit_screen.dart';
import 'package:untitled2/pages/home_page/home_screen.dart';
import 'package:untitled2/pages/main_screen/main_screen.dart';
import 'package:untitled2/pages/product_detail/product_detail_screen.dart';
import 'package:untitled2/pages/registerPage/register_page.dart';

import '../pages/login/login_screen.dart';
import '../pages/splash_screen/splash_screen.dart';

Map <String, Widget Function(BuildContext context)>route={
  '/homePage': (context) => const HomeScreen(),
  '/mainScreen': (context) => const MainScreen(),
  '/registerScreen': (context) => const RegisterScreen(),
  '/loginScreen': (context) => LoginScreen(),
  '/': (context) => const SplashScreen(),
  '/productDetailScreen': (context) => const ProductDetailScreen(),
  ProductListScreen.productListScreen: (context) =>
  const ProductListScreen(),
  UserEditScreen.userEditScreen: (context) => const UserEditScreen()
};
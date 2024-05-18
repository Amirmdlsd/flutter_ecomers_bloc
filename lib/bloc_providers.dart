import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/locator.dart';
import 'package:untitled2/main.dart';
import 'package:untitled2/pages/%20product_list/bloc/product_bloc.dart';
import 'package:untitled2/pages/home_page/bloc/home_bloc.dart';
import 'package:untitled2/pages/login/bloc/login_bloc.dart';
import 'package:untitled2/pages/main_screen/bloc/main_bloc.dart';
import 'package:untitled2/pages/product_detail/bloc/detail_bloc.dart';
import 'package:untitled2/pages/profile_screen/bloc/user_bloc.dart';
import 'package:untitled2/pages/registerPage/bloc/register_bloc.dart';

import 'pages/basket_screen/bloc/basket/bloc.dart';
import 'pages/basket_screen/bloc/basket_bloc.dart';
import 'pages/edit_page/bloc/edit_user_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => MainBloc()),
        BlocProvider(create: (context) => RegisterBloc()),
        BlocProvider(create: (context) => LoginBloc()),
        BlocProvider(create: (context) => HomeBLoc()),
        BlocProvider(create: (context) => ProductDetailBloc(locator())),
        BlocProvider(create: (context) => ProductListBloc(locator())),
        BlocProvider(create: (context) => NextBasketBloc(locator())),
        BlocProvider(create: (context) => BasketBloc(locator())),
        BlocProvider(create: (context) => UserBloc(locator())),
        BlocProvider(create: (context) => EditUserBloc(locator())),
      ],
      child: const FlutterApp(),
    );
  }
}

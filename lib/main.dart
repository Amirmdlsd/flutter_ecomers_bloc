import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:untitled2/locator.dart';
import 'package:untitled2/pages/%20product_list/bloc/product_bloc.dart';
import 'package:untitled2/pages/%20product_list/data/repository.dart';
import 'package:untitled2/pages/%20product_list/product_list_screen.dart';
import 'package:untitled2/pages/basket_screen/bloc/basket/bloc.dart';
import 'package:untitled2/pages/basket_screen/bloc/basket_bloc.dart';
import 'package:untitled2/pages/basket_screen/data/model/basket_model.dart';
import 'package:untitled2/pages/home_page/bloc/home_bloc.dart';
import 'package:untitled2/pages/home_page/home_screen.dart';
import 'package:untitled2/pages/login/bloc/login_bloc.dart';
import 'package:untitled2/pages/login/login_screen.dart';
import 'package:untitled2/pages/main_screen/bloc/main_bloc.dart';
import 'package:untitled2/pages/main_screen/main_screen.dart';
import 'package:untitled2/pages/product_detail/bloc/detail_bloc.dart';
import 'package:untitled2/pages/product_detail/product_detail_screen.dart';
import 'package:untitled2/pages/registerPage/bloc/register_bloc.dart';
import 'package:untitled2/pages/registerPage/register_page.dart';
import 'package:untitled2/pages/splash_screen/splash_screen.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter<BasketModel>(BasketModelAdapter());

  await Hive.openBox<BasketModel>('basket');

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyCuMFTFg68MW0RVbaTi7LmUbK1gXkYFWeU',
          appId: '1:82980735975:android:db13c04351f1e5feeccb42',
          messagingSenderId: '82980735975',
          projectId: 'ecomes-4dc0f'));
  await serviveLocator();

  runApp(const MyApp());
}

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
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp(
          theme: ThemeData(),
          routes: {
            '/homePage': (context) => const HomeScreen(),
            '/mainScreen': (context) => const MainScreen(),
            '/registerScreen':(context) => const RegisterScreen(),
            '/loginScreen': (context) => LoginScreen(),
            '/': (context) => const SplashScreen(),
            '/productDetailScreen': (context) => const ProductDetailScreen(),
            ProductListScreen.productListScreen: (context) =>
                const ProductListScreen()
          },
          builder: EasyLoading.init(),
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en'), // English
            Locale('fa'), // fa
          ],
          locale: const Locale('fa'),
          debugShowCheckedModeBanner: false,
          title: 'Ecomers',
          initialRoute: '/',
        ),
      ),
    );
  }
}

import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:untitled2/bloc_providers.dart';
import 'package:untitled2/locator.dart';

import 'package:untitled2/pages/basket_screen/data/model/basket_model.dart';
import 'package:untitled2/pages/edit_page/data/repository/repository.dart';

import 'package:untitled2/pages/profile_screen/data/repository/user_repository.dart';

import 'package:untitled2/route/route.dart';

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

class FlutterApp extends StatelessWidget {
  const FlutterApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        theme: ThemeData(),
        routes: route,
        //home: Test(),
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

        // home: Test(),
      ),
    );
  }
}

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text('data'),
          onPressed: () async {
            var a = await EditUserRepository(locator()).editUser(
                file: File('qweqe'), name: 'AMD', email: "amd@gmail.com");

            a.fold(
              (l) => print(l),
              (r) => print(r),
            );
          },
        ),
      ),
    );
  }
}

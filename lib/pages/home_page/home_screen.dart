import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:untitled2/config/colors.dart';
import 'package:untitled2/pages/home_page/bloc/home_bloc.dart';
import 'package:untitled2/pages/home_page/bloc/home_event.dart';
import 'package:untitled2/pages/home_page/bloc/home_state.dart';
import 'package:untitled2/pages/home_page/data/model/product_model.dart';
import 'package:untitled2/pages/home_page/widget/category_widget.dart';
import 'package:untitled2/pages/home_page/widget/home_slider.dart';
import 'package:untitled2/widget/cached_image.dart';

import '../../gen/assets.gen.dart';
import '../../widget/product_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    BlocProvider.of<HomeBLoc>(context).add(HomeFetchDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: BlocBuilder<HomeBLoc, HomeState>(
        builder: (context, state) {
          if (state is HomeResponseState) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // search bar

                  Container(
                    padding: EdgeInsets.only(left: 10.w),
                    margin:
                        EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
                    width: double.infinity,
                    height: 40.h,
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black12,
                              blurRadius: 1,
                              spreadRadius: 2,
                              offset: Offset(1, 1))
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.r)),
                    child: Row(children: [
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.search)),
                      const Expanded(
                          child: TextField(
                        decoration: InputDecoration(
                            hintText: 'دنبال چی میگردی',
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none)),
                      ))
                    ]),
                  ),

                  //slider
                  state.slider.fold(
                    (l) => const Text('خطا'),
                    (r) => HomeSlider(sliderList: r),
                  ),
                  SizedBox(height: 20.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'خرید بر اساس دسته‌بندی',
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        )),
                  ),
                  SizedBox(height: 10.h),
                  state.category.fold((l) => const Text('خطا'),
                      (cat) => CategoryItemList(categoryList: cat)),
                  SizedBox(
                    height: 20.h,
                  ),

                  //   amazing product
                  state.amazingProduct.fold(
                      (l) => const Text('error'),
                      (amazingProduct) => HomeScreenRowListView(
                            productList: amazingProduct,
                            first: 'پیشنهاد',
                            second: 'شگفت',
                            third: 'انگیز',
                          )),

                  SizedBox(height: 20.h,),
                    // most sell product
                  state.mostSellProduct.fold(
                      (l) => const Text('error'),
                      (mostSellProduct) => HomeScreenRowListView(
                        color: Colors.red,
                            productList: mostSellProduct,
                            first: 'پرفروش',
                            second: ' ترین ها',
                          )),
                ],
              ),
            );
          }
          return Container();
        },
      )),
    );
  }
}

class HomeScreenRowListView extends StatelessWidget {
  const HomeScreenRowListView({
    super.key,
    required this.productList,
    this.color = AppColors.customGreen,
    required this.first,
    required this.second,
    this.third = '',
  });

  final Color color;
  final List<ProductModel> productList;
  final String first;
  final String second;
  final String third;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 240.h,
      color: color,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SizedBox(width: 15.w),
            AmazingProductColumn(
              first: first,
              second: second,
              third: third,
            ),
            SizedBox(width: 15.w),
            ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: productList.length,
              itemBuilder: (context, index) =>
                  ProductItem(productModel: productList[index]),
            )
          ],
        ),
      ),
    );
  }
}

class AmazingProductColumn extends StatelessWidget {
  const AmazingProductColumn({
    super.key,
    required this.first,
    required this.second,
    this.third = '',
  });

  final String first;
  final String second;
  final String third;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30.h),
        // SizedBox(height: 30.h,),
        Text(
          first,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30.sp),
        ),
        Text(second,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30.sp)),
        Visibility(
          visible: third.isNotEmpty,
          child: Text(third,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.sp)),
        ),
        const Spacer(),
        Image.asset(
          Assets.images.freshbasket.path,
          width: 60.w,
        ),
        SizedBox(height: 30.h),
      ],
    );
  }
}
